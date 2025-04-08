struct A {
    value: Int?;
}

struct B {
    nested: A?;
}

struct C {
    second: B?;
}

contract OptionalNest {
    opt: C;
    
    init() {
        self.opt = C{
            second: null,
        };
    }
}