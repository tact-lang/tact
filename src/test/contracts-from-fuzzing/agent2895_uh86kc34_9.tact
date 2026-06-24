struct Middle {
    one: Int;
    two: Bool;
}

struct Larger {
    first: Middle;
    second: Middle;
    third: Middle;
}

contract MultipleStructs {
    s: Larger;

    init() {
        self.s = Larger{
            first: Middle{ one: 1, two: true },
            second: Middle{ one: 2, two: false },
            third: Middle{ one: 3, two: true }
        };
    }
}
