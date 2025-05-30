struct Deep {
    nested1: Bool;
    nested2: Int;
    nested3: Bool?;
    nested4: Int?;
}

struct Middle {
    deep: Deep;
    f1: Int;
    f2: Bool;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            deep: Deep{
                nested1: true,
                nested2: 10,
                nested3: null,
                nested4: null
            },
            f1: 20,
            f2: false
        };
    }
}