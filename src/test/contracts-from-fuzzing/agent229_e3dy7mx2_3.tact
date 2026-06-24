struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    s: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    num: Int;
}

contract DeepNested {
    storage: Outer;
    
    init() {
        self.storage = Outer{
            mid: Middle{
                s: Inner{
                    x: 42,
                    y: "deep"
                },
                flag: true
            },
            num: -1
        };
    }
}
