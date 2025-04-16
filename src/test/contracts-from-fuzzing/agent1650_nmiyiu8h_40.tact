struct Deeply {
    s: String;
}

struct Mid {
    inn: Deeply;
}

contract OptionalStringStruct {
    mid: Mid?;

    init() {
        self.mid = null;
    }
}