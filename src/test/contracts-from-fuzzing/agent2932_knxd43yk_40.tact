struct DupInside {
    v: Int;
}
contract SameStructTwice {
    a: DupInside;
    b: DupInside;

    init() {
        self.a = DupInside{ v:1 };
        self.b = DupInside{ v:2 };
    }
}