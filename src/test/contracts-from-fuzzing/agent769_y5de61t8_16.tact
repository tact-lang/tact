struct Msg1 { a: Int; }
struct Msg2 { b: Int; }

struct Container {
    aa: Msg1;
    bb: Msg2;
}

contract NestedStructs {
    data: Container;
    init() {
        self.data = Container{
            aa: Msg1{ a: 123 },
            bb: Msg2{ b: 456 }
        };
    }
}