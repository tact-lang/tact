struct B {
    str: String;
    n: Int?;
}

struct A {
    optB: B?;
}

contract Test {
    nestedOpt: A;
    init() {
        self.nestedOpt = A{
            optB: null
        };
    }
}