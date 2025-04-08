struct Inner {
    iv1: Int;
    iv2: Bool;
    iv3: String;
}

contract MultiFieldStructWithOptions {
    x: Inner?;
    y: Int;
    z: Bool?;

    init() {
        self.x = Inner{
            iv1: 7,
            iv2: false,
            iv3: "test"
        };
        self.y = 42;
        self.z = null;
    }
}