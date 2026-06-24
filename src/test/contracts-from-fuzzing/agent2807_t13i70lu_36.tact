struct Leaf {
    n: Int?;
}

struct Mid {
    leaf: Leaf;
    txt: String = "x";
}

struct Top {
    mid: Mid;
    flag: Bool;
}

contract DeepOptionDefault {
    data: Top;
    init() {
        self.data = Top{
            mid: Mid{ leaf: Leaf{} },
            flag: false
        };
    }
}