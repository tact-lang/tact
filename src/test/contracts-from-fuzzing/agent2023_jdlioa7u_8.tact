struct InnerMost {
    info: String;
    number: Int;
    flag: Bool?;
}

struct InnerMid {
    inner1: InnerMost;
    inner2: InnerMost;
    s: String?;
}

struct InnerOuter {
    x: Int;
    innerMid: InnerMid;
}

contract TestContract {
    deeplyNested: InnerOuter;

    init() {
        self.deeplyNested = InnerOuter{
            x: 10,
            innerMid: InnerMid{
                inner1: InnerMost{
                    info: "hi",
                    number: 2,
                    flag: true,
                },
                inner2: InnerMost{
                    info: "yo",
                    number: 3,
                    flag: null,
                },
                s: null,
            }
        };
    }

    receive() {
        let p = self.deeplyNested.innerMid.inner1.info;
    }
}