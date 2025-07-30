struct MultipleNested {
    s1: String;
    optSub: SubStruct?;
    flag: Bool;
}

struct SubStruct {
    text: String;
    num: Int;
    flag2: Bool;
}

contract OptionalSubStruct {
    data: MultipleNested;

    init() {
        self.data = MultipleNested{
            s1: "a",
            optSub: SubStruct{
                text: "b",
                num: 42,
                flag2: false
            },
            flag: true
        };
    }
}
