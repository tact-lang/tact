struct NestedManyLevels {
 a: Int;
 b: Bool;
 c: Inner1;
}

struct Inner1 {
 d: Int;
 e: Bool;
 f: Inner2;
}

struct Inner2 {
 g: Int;
 h: Bool;
 i: Inner3;
}

struct Inner3 {
 j: Int;
 k: Bool;
}

contract DeepMixed {
 state: NestedManyLevels = NestedManyLevels{
   a: 1, b: true,
   c: Inner1{
     d: 2, e: false,
     f: Inner2{
       g: 3, h: true,
       i: Inner3{ j: 4, k: false }
     }
   }
 };
 
 init() {}
}
