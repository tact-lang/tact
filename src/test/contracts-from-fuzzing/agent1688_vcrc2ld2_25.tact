struct Inner { level: Int; }

struct Outer {
    description: String;
    nested: Inner?;
}

contract TestContract {
    count: Int;
    outer: Outer;
    flag: Bool;
    optInner: Inner?;

    init() {
        self.count = 1;
        self.outer = Outer{description: "desc", nested: null};
        self.flag = true;
        self.optInner = Inner{level:42};
    }
}