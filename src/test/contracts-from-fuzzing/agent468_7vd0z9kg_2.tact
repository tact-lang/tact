struct Leaf {
    val: Int;
}

struct Middle {
    leaf: Leaf;
    comment: String;
}

struct Top {
    middle: Middle;
    flag: Bool;
}

contract DeepStruct {
    top: Top;

    init() {
        self.top = Top{
            middle: Middle{
                leaf: Leaf{ val: 123 },
                comment: "hi"
            },
            flag: true
        };
    }
}