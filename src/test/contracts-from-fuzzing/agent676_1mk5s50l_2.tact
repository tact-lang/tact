struct A {
    x: Int;
    y: Int?;
    z: Bool;
    s: String;
}

contract Test {
    data: A;

    init() {
        self.data = A{
            x: 10,
            y: null,
            z: false,
            s: "Test"
        };
    }
}