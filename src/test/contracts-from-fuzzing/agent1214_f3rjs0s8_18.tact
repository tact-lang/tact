struct SlightlyNested {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract MixOptDefault {
    sn: SlightlyNested;
    s2: SlightlyNested;
    init() {
        self.sn = SlightlyNested{ foo: 12, bar: null, baz: "hello" };
        self.s2 = SlightlyNested{ foo: 99, bar: true, baz: "world" };
    }
}