struct MediumDepth {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Cell;
    s5: Address;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
}

struct Container {
    inner: MediumDepth;
    optInner: MediumDepth?;
    strVal: String;
}

contract OptionalNestedTest {
    container: Container;

    init() {
        self.container = Container{
            inner: MediumDepth{
                s1: 1,
                s2: false,
                s3: "abc",
                s4: emptyCell(),
                s5: myAddress(),
                optInt: null,
                optBool: null,
                optAddr: null,
                optString: null,
            },
            optInner: null,
            strVal: "def",
        };
    }
}