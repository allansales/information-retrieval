import numpy as np

a = np.matrix([
	[0,0,0,0,0,0],
	[1.0,0,1.0/3.0,1.0/3.0,1.0/4.0,0],
	[0,1.0/3.0,0,1.0/3.0,1.0/4.0,0],
	[0,1.0/3.0,1.0/3.0,0,1.0/4.0,0],
	[0,1.0/3.0,1.0/3.0,1.0/3.0,0,0],
	[0,0,0,0,1.0/4.0,0]])
	
print 'a:','\n',a

b = (float(1)/float(6))*np.matrix([
	[1,1,1,1,1,1],
	[1,1,1,1,1,1],
	[1,1,1,1,1,1],
	[1,1,1,1,1,1],
	[1,1,1,1,1,1],
	[1,1,1,1,1,1]])

m = 0.85*a+0.15*b
print 'm:','\n',m

v = (float(1)/float(6))*np.matrix([
	[1],
	[1],
	[1],
	[1],
	[1],
	[1]])

print 'v:','\n',v

count = 0

def pagerank(v):
	global count
	if sum(abs(m*v-v))>0.001:
		count+=1
		print 'count:',count
		print m*v
		print 'sum(abs(m*v-v)):',sum(abs(m*v-v))
		return pagerank(m*v)
	else:
		count+=1
		print 'count:',count
		print m*v
		print 'sum(abs(m*v-v)):',sum(abs(m*v-v))
		return m*v

#result = pagerank(v)

#print 'Sorted result:','\n',sorted(result, reverse=True)
#print 'B','E','C','D','F','A'


