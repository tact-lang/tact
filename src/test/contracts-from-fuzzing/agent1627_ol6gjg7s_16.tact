struct SubNested {
    one: Int;
    two: Bool;
}

struct Middle {
    s: SubNested;
    txt: String;
    n: Int?;
}

contract DeepOptStruct {
    val: Middle;

    init() {
        self.val = Middle{
            s: SubNested{
                one: 33,
                two: false
            },
            txt: "mid",
            n: null
        };
    }
}
