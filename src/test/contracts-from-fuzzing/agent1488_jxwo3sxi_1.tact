struct NestedInner {
    n: Int;
    flag: Bool;
}

struct NestedOuter {
    num: Int = 5;
    optInner: NestedInner?;
    txt: String;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            num: 10,
            optInner: NestedInner{ n: 1, flag: true },
            txt: "hi"
        };
    }
}