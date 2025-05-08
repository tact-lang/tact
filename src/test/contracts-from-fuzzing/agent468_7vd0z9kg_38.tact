// Stress deep nested recursion with large inner structs in outer struct
struct InnerMega {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Int; g: Int; h: Int; i: Int; j: Int;
  k: Int; l: Int; m: Int; n: Int; o: Int;
  p: Int; q: Int; r: Int; s: Int; t: Int;
  u: Int; v: Int; w: Int; x: Int; y: Int;
  z: Int;
}

struct OuterMega {
  inner1: InnerMega;
  inner2: InnerMega;
  inner3: InnerMega;
  note: String;
}

contract RecursiveMega {
  val: OuterMega;

  init() {
    self.val = OuterMega{
      inner1: InnerMega{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
        k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20,
        u:21,v:22,w:23,x:24,y:25,z:26
      },
      inner2: InnerMega{
        a:101,b:102,c:103,d:104,e:105,f:106,g:107,h:108,i:109,j:110,
        k:111,l:112,m:113,n:114,o:115,p:116,q:117,r:118,s:119,t:120,
        u:121,v:122,w:123,x:124,y:125,z:126
      },
      inner3: InnerMega{
        a:201,b:202,c:203,d:204,e:205,f:206,g:207,h:208,i:209,j:210,
        k:211,l:212,m:213,n:214,o:215,p:216,q:217,r:218,s:219,t:220,
        u:221,v:222,w:223,x:224,y:225,z:226
      },
      note: "heavy"
    };
  }
}