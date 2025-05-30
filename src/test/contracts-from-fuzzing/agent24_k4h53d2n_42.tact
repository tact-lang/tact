struct OuterInner {
    outerVal: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract OuterInnerTest {
    data: OuterInner;

    init() {
        self.data = OuterInner{
            outerVal: 12,
            inner: InnerStruct {
                flag: true,
                text: "abc"
            }
        };
    }
}