struct BigS {
  a: Int; b: Int; c: Int; d: Int; e: Int; f: Int;
  g: Int; h: Int; i: Int; j: Int; k: Int; l: Int;
}

contract ManyStructs {
  s1: BigS;
  s2: BigS;

  init() {
    self.s1 = BigS{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12};
    self.s2 = BigS{a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,i:19,j:20,k:21,l:22};
  }
}