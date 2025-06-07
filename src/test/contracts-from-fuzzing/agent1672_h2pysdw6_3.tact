struct A {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    s: A;

    init() {
        self.s = A{
            x: null,
            y: true,
            z: "hello"
        };
    }
}
