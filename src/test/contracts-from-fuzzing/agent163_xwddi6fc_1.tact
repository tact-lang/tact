struct Complex {
    x: Int;
    y: Bool;
    z: String;
    flag: Bool?;
    nested: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestStorage {
    comp: Complex;

    init() {
        self.comp = Complex{
            x: 42,
            y: false,
            z: "hello",
            flag: null,
            nested: null
        };
    }
}
