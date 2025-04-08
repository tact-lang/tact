// optional field with no default then deeply nested inside
struct Inner {
 b:Int?;
}

struct Outer {
 i:Inner;
}

contract Test {
 o:Outer;
 init(){ self.o = Outer{ i: Inner{ b: null } }; }
}