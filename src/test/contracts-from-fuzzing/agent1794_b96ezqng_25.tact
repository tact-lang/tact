struct Subnested {
 innerInt: Int;
}

struct Nested {
 x: Int;
 y: Bool;
 sub: Subnested;
}

contract NestedWithSimple {
    a: Int;
    b: Bool;
    nested: Nested;

    init() {
        self.a=1;
        self.b=true;
        self.nested = Nested{
            x: 10,
            y: false,
            sub: Subnested { innerInt: 123 }
        };
    }
}
