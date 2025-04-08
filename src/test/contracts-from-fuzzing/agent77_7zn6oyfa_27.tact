// Contract with structs with nested optional fields defaulted to null
struct S {
 a: Int?;
 b: Bool?;
}

struct T {
 s: S?;
}

contract OptStructNull {
 v: T;
 init() {
   self.v = T { s:null };
 }
}