struct Levels3 {
    a: Int;
}

struct Levels2 {
    b: Levels3;
}

struct Levels1 {
    c: Levels2;
}

contract Nested3Layer {
    foo: Levels1;
    init() {
        self.foo = Levels1{ c: Levels2{ b: Levels3{ a: 777 } } };
    }
}