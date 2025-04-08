struct Wrap1 {
    wrap2: Wrap2;
    flag: Bool?;
}

struct Wrap2 {
    optInt: Int?;
}

contract MixedNestingOptional {
    storage: Wrap1;

    init() {
        self.storage = Wrap1{ wrap2: Wrap2{ optInt: null }, flag: null };
    }
}