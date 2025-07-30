struct Duo {
    fst: Int;
    snd: Bool?;
}

struct NestedDuo {
    duo: Duo?;
    flag: Bool;
}

contract OptionalNesting {
    val: NestedDuo;

    init() {
        self.val = NestedDuo {
            duo: null,
            flag: true
        };
    }
}
