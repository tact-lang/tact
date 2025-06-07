struct Sub1 {
    a: Int?;
    b: Bool;
}

struct Sub2 {
    x: String;
    y: Cell?;
}

struct Container {
    sub1: Sub1?;
    sub2: Sub2?;
}

contract OptionalComplex {
    state: Container;
    
    init() {
        self.state = Container{
            sub1: Sub1{ a: null, b: true },
            sub2: null
        };
    }
}
