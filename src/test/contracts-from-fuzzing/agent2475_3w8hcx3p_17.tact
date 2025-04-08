struct StrA {
    foo: Int;
}

struct StrB {
    bar: Int;
}

struct Container {
    a: StrA;
    b: StrB;
}

contract ManyNestStructs {
    cont: Container;
    init() {
        self.cont = Container{ a: StrA{foo:1}, b:StrB{bar:2} };
    }
}