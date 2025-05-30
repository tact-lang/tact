struct A {
    x: Int?;
    y: B?;
}

struct B {
    q: Int?;
    z: String?;
}

contract OptionChain {
    data: A;

    init() {
        self.data = A{
            x: null,
            y: null
        };
    }
}