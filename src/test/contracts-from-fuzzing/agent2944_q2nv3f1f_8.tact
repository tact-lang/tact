struct Inner {
    s: String;
    n: Int?;
}

struct Outer {
    text: String;
    innerStruct: Inner;
    optInner: Inner?;
}

contract OptionalInnerStruct {
    val: Outer;

    init() {
        self.val = Outer{
            text: "hello",
            innerStruct: Inner{s: "world", n: null},
            optInner: null
        };
    }
}