struct S1 { a: Int }
struct S2 { b: Int }

struct WithMany {
    x1: S1;
    x2: S2;
    opt1: Int?;
    opt2: String?;
    flag: Bool;
    text: String;
}

contract ManyMixed {
    val: WithMany;

    init() {
        self.val = WithMany{
            x1: S1{ a: 1 },
            x2: S2{ b: 2 },
            opt1: null,
            opt2: null,
            flag: true,
            text: "yeah"
        };
    }
}