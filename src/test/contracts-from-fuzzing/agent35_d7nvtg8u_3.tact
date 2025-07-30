struct X { a: Int; }
struct Y { b: Bool; }
struct Z {
    x: X;
    y: Y;
    val: Int;
    optStr: String?;
}

contract MultiNestedStruct {
    foo: Z;
    
    init() {
        self.foo = Z {
            x: X { a: 10 },
            y: Y { b: true },
            val: 77,
            optStr: null
        };
    }
}