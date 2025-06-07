struct MultiTypeNested {
    i: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optBool: Bool?;
}

contract MixedTypes {
    x: Int;
    y: Bool;
    z: String;
    nested: MultiTypeNested;

    init() {
        self.x = 1;
        self.y = true;
        self.z = "hello";
        self.nested = MultiTypeNested {
            i: 100,
            b: false,
            s: "world",
            optInt: null,
            optBool: true,
        };
    }
}