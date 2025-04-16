struct DeepMixed {
    x: Int;
    y: Int?;
    s: Sub1;
    t: Sub2?;
}

struct Sub1 {
    a: Int;
    b: Bool?;
}

struct Sub2 {
    c: String;
    d: Bool;
}

contract MultiLayers {
    data: DeepMixed;

    init() {
        self.data = DeepMixed{
            x: 1, y: null, s: Sub1{ a: 2, b: null }, t: null
        };
    }
}