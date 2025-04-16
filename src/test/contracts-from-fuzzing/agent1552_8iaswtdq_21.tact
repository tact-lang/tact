struct DeepInner {
    val: Int;
    flag: Bool;
}

struct Mid {
    inner: DeepInner;
    number: Int;
}

struct Outer {
    mid: Mid;
    text: String;
    opt: Bool?;
}

contract ThreeLevelOptional {
    f: Outer;

    init() {
        self.f = Outer{
            mid: Mid{ inner: DeepInner{val:1, flag:true}, number: 2 },
            text: "3",
            opt: null,
        };
    }
}