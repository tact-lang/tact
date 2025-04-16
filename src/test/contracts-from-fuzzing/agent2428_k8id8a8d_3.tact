struct Deep {
    flag: Bool;
    num: Int;
}

struct Mid {
    nested: Deep;
    done: Bool;
}

struct Top {
    middle: Mid;
    info: Int;
}

contract TestContract {
    storage: Top;

    init() {
        self.storage = Top{
            middle: Mid{
                nested: Deep{ flag: true, num: 7 },
                done: false
            },
            info: 999
        };
    }
}