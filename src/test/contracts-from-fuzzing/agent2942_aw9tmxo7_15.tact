struct Tiny { f: Int }

struct Mid1 { t: Tiny }
struct Mid2 { t: Tiny }

struct Both {
    left: Mid1;
    right: Mid2;
}

contract WideNested {
    storage: Both;

    init() {
        self.storage = Both{
            left: Mid1{ t: Tiny{ f: 1 } },
            right: Mid2{ t: Tiny{ f: 2 } },
        };
    }
}