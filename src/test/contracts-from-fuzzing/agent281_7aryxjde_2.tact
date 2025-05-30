struct DeepNested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    val: Int;
    yesno: Bool;
}

contract TestDeep {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            inner: Inner{val: 42, yesno: false},
            flag: true
        };
    }
}