struct DeepCombo {
    str: String;
    optStr: String?;
    addr: Address;
    optAddr: Address?;
    nested: ComboInner;
}

struct ComboInner {
    x: Int;
    y: Int?;
    z: Bool;
    q: Bool?;
}

contract Test28 {
    val: DeepCombo;

    init() {
        self.val = DeepCombo{
            str: "test",
            optStr: null,
            addr: myAddress(),
            optAddr: null,
            nested: ComboInner{
                x: 1,
                y: null,
                z: true,
                q: null,
            },
        };
    }

    receive() {}
}