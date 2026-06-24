struct A {
    x: Int = 1;
    y: Bool = true;
    z: Address;
    nested: B;
}

struct B {
    q: Int?;
    r: Bool;
}

contract Test {
    a: A;

    init() {
        self.a = A{
            z: myAddress(),
            nested: B{ q: null, r: false },
        };
    }
}