struct L {
    x: Int;
    y: String;
    z: Bool?;
}

contract LargeInit {
    rec: L;

    init() {
        self.rec = L{
            x: 42,
            y: "hi",
            z: null,
        };
    }
}