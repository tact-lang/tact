struct DeepInner {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
    f6: String?;
    f7: Int?;
}

struct DeepStruct {
    nested: DeepInner?;
    flag: Bool;
}

contract TestContract {
    deep: DeepStruct;

    init() {
        self.deep = DeepStruct{
            nested: DeepInner{
                f1: 7,
                f2: null,
                f3: myAddress(),
                f4: emptyCell(),
                f5: null,
                f6: "hi",
                f7: null,
            },
            flag: true,
        };
    }
}