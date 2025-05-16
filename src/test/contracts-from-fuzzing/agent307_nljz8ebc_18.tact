struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Inner;
}

struct Inner {
    x: Int = 1;
    y: Bool = false;
    z: String = "de";
}

contract TestStorage {
    store: Complex;

    init() {
        self.store = Complex{
            a: 11,
            b: false,
            c: "hi",
            d: null,
            e: true,
            f: null,
            g: Inner{},
        };
    }
}