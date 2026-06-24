struct A {
    x: Int;
    y: Int?;
    z: Bool;
}

contract TestContract {
    a: A;
    init() {
        self.a = A{
            x: 7,
            y: null,
            z: true,
        };
    }
}