struct LeafS {
 x: Int;
}

struct MidS {
 a: LeafS;
 b: LeafS;
}

struct RootS {
 a: MidS;
 b: MidS;
 c: MidS;
}

contract WideDeepNesting {
 r: RootS;
 init() {
   self.r = RootS{
     a: MidS{a:LeafS{x:1},b:LeafS{x:2}},
     b: MidS{a:LeafS{x:3},b:LeafS{x:4}},
     c: MidS{a:LeafS{x:5},b:LeafS{x:6}}
   };
 }
}