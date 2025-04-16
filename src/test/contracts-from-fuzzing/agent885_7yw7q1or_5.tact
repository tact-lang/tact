struct MixStruct {
    foo: Int;
    bar: Bool?;
    z: String;
    q: Cell;
    a: String?;
    b: Bool;
}

contract MixedFields {
    ms: MixStruct;

    init() {
        self.ms = MixStruct {
            foo: 1,
            bar: null,
            z: "hello",
            q: emptyCell(),
            a: null,
            b: true
        };
    }
}
