struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    deep: DeepInner;
    note: String;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                deep: DeepInner{
                    x: 42,
                    y: false
                },
                note: "text"
            },
            flag: true
        };
    }
}