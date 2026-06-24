struct DeeplyNested {
    point: InnerLevel1;
}

struct InnerLevel1 {
    sub: InnerLevel2;
    flag: Bool;
}

struct InnerLevel2 {
    flag2: Bool;
    maybeText: String?;
}

contract TestDeepNested {
    data: DeeplyNested;
    init() {
        self.data = DeeplyNested{
            point: InnerLevel1{
                sub: InnerLevel2{
                    flag2: true,
                    maybeText: null
                },
                flag: false
            }
        };
    }
}