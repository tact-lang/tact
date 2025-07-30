struct Leaf {
    v: Int;
    txt: String?;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool;
}

struct Top {
    middle: Mid?;
    count: Int;
}

contract DeepOptionStructs {
    persistent: Top;

    init() {
        self.persistent = Top{
            middle: Mid{
                leaf: null,
                flag: true
            },
            count: 7
        };
    }
}