struct V {
    x: Int;
    y: String;
    z: Bool;
    a: Int?;
    b: String?;
    c: Bool?;
}

contract FullMixStruct {
    data: V;

    init() {
        self.data = V{
            x: 1,
            y: "hello",
            z: false,
            a: null,
            b: null,
            c: null
        };
    }
}