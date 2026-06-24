struct OptionalDeepChain {
    a: B?;
}

struct B {
    b: C?;
}

struct C {
    c: Int?;
}

contract ChainOptionals {
    data: OptionalDeepChain;

    init() {
        self.data = OptionalDeepChain{a: null};
    }
}
