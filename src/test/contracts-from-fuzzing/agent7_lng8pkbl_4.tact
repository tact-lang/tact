struct NestedDeeper {
    deep: Int?;
}

struct DeepMid {
    inner: NestedDeeper;
    text: String;
}

struct TopStruct {
    mid: DeepMid;
    optStr: String?;
    flag: Bool;
}

contract DeeplyNested {
    t: TopStruct;

    init() {
        self.t = TopStruct{
            mid: DeepMid{
                inner: NestedDeeper{deep: null},
                text: "Hi"
            },
            optStr: null,
            flag: true
        };
    }
}