struct Inner1 {
    x: Int?;
    y: Bool;
}

struct Inner2 {
    desc: String?;
    flag: Bool;
}

struct Mid {
    one: Inner1;
    two: Inner2?;
}

struct TopModel {
    mid: Mid?;
    id: Int;
}

contract NestedComplex {
    data: TopModel;

    init() {
        self.data = TopModel{
            mid: null,
            id: 999
        };
    }
}
