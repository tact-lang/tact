struct Innermost {
    s: String;
}

struct Middle {
    inn: Innermost;
    b: Bool;
}

struct Outer {
    mid: Middle;
    i: Int;
}

contract ManyNestAllTypes {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                inn: Innermost{s: "abc"},
                b: true,
            },
            i: 999,
        };
    }
}