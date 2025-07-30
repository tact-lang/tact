struct Inner1 { val1: Int; val2: Bool; }
struct Inner2 { x: String; y: Bool; z: Int; }
struct NestedCombo {
    i1: Inner1;
    i2: Inner2;
    optionalInner: Inner1?;
    text: String;
    flag: Bool;
}

contract ComboTest {
    data: NestedCombo;

    init() {
        self.data = NestedCombo{
            i1: Inner1{ val1: 10, val2: true },
            i2: Inner2{ x: "hi", y: false, z: 33 },
            optionalInner: null,
            text: "foo",
            flag: true,
        };
    }
}
