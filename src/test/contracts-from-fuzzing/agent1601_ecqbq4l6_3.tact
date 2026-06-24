struct Deep {
    level: Int;
    child: Child;
}

struct Child {
    name: String;
    flag: Bool;
}

contract T {
    deep: Deep;
    init() {
        self.deep = Deep{
            level: 1,
            child: Child{ name: "x", flag: true },
        };
    }
}