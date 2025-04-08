struct DeepInner {
    val1: Int;
    val2: Bool;
}

struct Middle {
    deep: DeepInner;
    flag: Bool;
}

contract DeepNested {
    mid: Middle;

    init() {
        self.mid = Middle{
            deep: DeepInner{
                val1: 7,
                val2: false
            },
            flag: true
        };
    }
}