struct Deep {
    a: Int;
}

struct Mid {
    a: Deep;
}

struct Mid2 {
    a: Mid;
}

contract InitDeepDefaults {
    storage: Mid2;

    init() {
        self.storage = Mid2{
            a: Mid{
                a: Deep{
                    a: 5
                }
            }
        };
    }
}