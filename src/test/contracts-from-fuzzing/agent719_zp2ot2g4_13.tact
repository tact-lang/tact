struct Huge {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Int; g: Int; h: Int; i: Int; j: Int;
  k: Int; l: Int; m: Int; n: Int; o: Int;
  p: Bool; q: Bool; r: Bool; s: Bool; t: Bool;
  u: String; v: String;
}

contract TestContract {
    data: Huge;
    init() {
        self.data = Huge{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:11,l:12,m:13,n:14,o:15,p:true,q:false,r:true,s:false,t:true,
            u:"u", v:"v"
        };
    }
}