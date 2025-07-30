struct Sandwich {
    first: Int;
    middleOpt: Bool?;
    last: String;
}

contract OptMiddle {
    s: Sandwich;

    init() {
        self.s = Sandwich{
            first: 1,
            middleOpt: null,
            last: "done"
        };
    }
}