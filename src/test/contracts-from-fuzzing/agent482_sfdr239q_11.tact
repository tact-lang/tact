struct InnerMost {
    z: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outermost {
    mid: Middle;
    flag: Bool;
}

contract DeepStructNested {
    storage: Outermost;

    init() {
        self.storage = Outermost{
            mid: Middle{
                inner: InnerMost{ z: 100 }
            },
            flag: true
        };
    }
}
