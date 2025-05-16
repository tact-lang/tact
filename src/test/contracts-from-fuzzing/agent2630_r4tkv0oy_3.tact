struct DeepInner {
    val: Int;
}

struct MidInner {
    deep: DeepInner;
    flag: Bool;
}

struct Outer {
    mid: MidInner;
    addr: Address;
}

contract DeepNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: MidInner{
                deep: DeepInner{ val: 7 },
                flag: false
            },
            addr: myAddress()
        };
    }
}