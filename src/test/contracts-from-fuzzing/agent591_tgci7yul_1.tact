struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    count: Int;
}

contract NestTest {
    data: Outer;
    
    init() {
        self.data = Outer{ nested: Inner{ a: 1, b: true }, flag: false, count: 10 };
    }
}