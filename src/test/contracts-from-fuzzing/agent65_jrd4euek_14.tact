struct InnerMost {
 a: Int;
}

struct Mid1 {
 x: InnerMost?;
}

struct Mid2 {
 y: Mid1?;
}

contract NullableDeep {
 store: Mid2?;
 init() {
   self.store = null;
 }
}