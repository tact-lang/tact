struct MixedNested {
    x: Int;
    y: String;
    inner: InnerWrap;
}

struct InnerWrap {
    flag: Bool;
    txt: String;
    nested: InnerMost;
}

struct InnerMost {
    a: Int;
    b: Bool?;
    s: String;
}

contract MixedNestedStructs {
    complex: MixedNested;

    init() {
        self.complex = MixedNested{
            x: 12,
            y: "hi",
            inner: InnerWrap{
                flag: false,
                txt: "middle",
                nested: InnerMost{
                    a:7, b:null, s:"deep"
                }
            }
        };
    }
}
