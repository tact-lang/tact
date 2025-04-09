struct A { a: Int; }
struct B { b: Bool; }

struct Outer {
    innerOpt: A?;
    innerReg: B;
}

contract MixedNestedOptionals {
    state: Outer;

    init() {
        self.state = Outer{
            innerOpt: null,
            innerReg: B{ b: true }
        };
    }
}