struct ManyBool {
 a: Bool;b: Bool;c: Bool;d: Bool;e: Bool;f: Bool;g: Bool;h: Bool;i: Bool;j: Bool;
 k: Bool;l: Bool;m: Bool;n: Bool;o: Bool;p: Bool;q: Bool;r: Bool;s: Bool;t: Bool;
 u: Bool;v: Bool;w: Bool;x: Bool;y: Bool;z: Bool;
}

contract ManyBoolContract {
 storage: ManyBool;
 init() {
  self.storage = ManyBool{
   a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true,i:true,j:true,
   k:true,l:true,m:true,n:true,o:true,p:true,q:true,r:true,s:true,t:true,
   u:true,v:true,w:true,x:true,y:true,z:true
  };
 }
}