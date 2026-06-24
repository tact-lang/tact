struct SInner {
    a: Int?;
    b: Bool;
}

struct SOuter {
    inner_1: SInner?;
    inner_2: SInner?;
    inner_3: SInner?;
    flag: Bool;
    text: String;
    num: Int;
}

contract TestContract {
    s: SOuter;

    init() {
        self.s = SOuter{
            inner_1: null,
            inner_2: SInner{a:1,b:true},
            inner_3: null,
            flag: true,
            text: "hi",
            num: 42
        };
    }
}