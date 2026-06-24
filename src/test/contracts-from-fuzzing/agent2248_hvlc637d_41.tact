struct Leaf {
    num: Int;
}

struct Root {
    part: Leaf?;
    label: String;
}

contract MixedOptNest {
    data: Root;

    init() {
        self.data = Root{
            part: Leaf{num:42},
            label:"ok"
        };
    }
}