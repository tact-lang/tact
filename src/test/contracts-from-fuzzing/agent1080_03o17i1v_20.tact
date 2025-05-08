struct S2 {
 a: Int;
}

struct S1 {
 nested: S2;
}

contract DeepOpt {
 field: S1?;

 init() {
   self.field = null;
 }
}