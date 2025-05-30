struct Mid {
    innerInt: Int;
    flag: Bool;
    text: String;
}

struct Top {
    a: Mid;
    b: Mid;
    c: Mid;
}

contract RepeatedNested {
    store: Top;

    init() {
        self.store = Top{
            a: Mid{innerInt: 1, flag: true, text: "a"},
            b: Mid{innerInt: 2, flag: false, text: "b"},
            c: Mid{innerInt: 3, flag: true, text: "c"}
        };
    }
}