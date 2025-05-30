struct S {
    x: Int;
    y: Bool?;
    z: String?;
}

contract UpdatePersistentInInit {
    s: S;

    init() {
        self.s = S{
            x: 10,
            y: null,
            z: "hello"
        };
        self.s = S{
            x: 20,
            y: true,
            z: null
        };
    }
}