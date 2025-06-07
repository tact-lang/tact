struct Fixed {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayLike {
    item0: Fixed;
    item1: Fixed;
    item2: Fixed;
    item3: Fixed;

    init() {
        self.item0 = Fixed{a: 1, b: true, c: "x"};
        self.item1 = Fixed{a: 2, b: false, c: "y"};
        self.item2 = Fixed{a: 3, b: true, c: "z"};
        self.item3 = Fixed{a: 4, b: false, c: "w"};
    }
}