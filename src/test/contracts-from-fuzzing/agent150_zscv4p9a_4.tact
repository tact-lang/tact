struct A {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFields {
    data: A;

    init() {
        self.data = A{
            x: null,
            y: null,
            z: null,
        };
    }
}