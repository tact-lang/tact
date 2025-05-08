struct A {
    x: Int;
    y: String?;
}

struct B {
    a: A?;
    z: Bool;
}

contract ContractB {
    b: B;

    init() {
        self.b = B{ a: null, z: true };
    }
}
