struct A {
    x: Int?;
}

struct B {
    y: A?;
}

struct C {
    z: B?;
}

contract DeepOptionalChain {
    data: C;
    init() {
        self.data = C{z:null};
    }
}