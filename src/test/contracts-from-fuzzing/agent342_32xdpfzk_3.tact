struct DeepInner {
    val: Int;
    flag: Bool;
}

struct Middle {
    deep: DeepInner;
    msg: String;
}

struct Outer {
    middle: Middle;
    addr: Address;
}

contract Test3 {
    info: Outer;

    init() {
        self.info = Outer{
            middle: Middle{
                deep: DeepInner{
                    val: 10,
                    flag: true,
                },
                msg: "deep nesting",
            },
            addr: myAddress(),
        };
    }
}