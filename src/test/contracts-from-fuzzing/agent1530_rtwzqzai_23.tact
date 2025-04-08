struct Tiny {
    tiny: Bool;
}

struct Mid {
    sub1: Tiny;
    sub2: Tiny;
}

struct Large {
    fieldA: Mid;
    fieldB: Mid;
}

contract TestContract {
    store: Large;

    init() {
        self.store = Large{
            fieldA: Mid{ sub1: Tiny{ tiny: true }, sub2: Tiny{ tiny: false } },
            fieldB: Mid{ sub1: Tiny{ tiny: false }, sub2: Tiny{ tiny: true } }
        };
    }
}
