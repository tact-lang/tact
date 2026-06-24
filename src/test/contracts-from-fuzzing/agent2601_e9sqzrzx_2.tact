struct InnerMost {
    x: Int;
    y: Bool;
}

struct Mid {
    nest: InnerMost;
    s: String;
}

struct Outer {
    lvl2: Mid;
    flag: Bool;
    num: Int;
}

contract TestContract {
    storage: Outer;
    init() {
        self.storage = Outer{
            lvl2: Mid{ nest: InnerMost{ x: 1, y: true }, s: "ok" },
            flag: false,
            num: 999
        };
    }
}