struct Sub1 {
    x: Int;
}
struct Sub2 {
    flag: Bool;
}

struct MultiNest {
    s1: Sub1;
    s2: Sub2;
    text: String;
}

contract ManyNested {
    rec: MultiNest;

    init() {
        self.rec = MultiNest{
            s1: Sub1{ x: 7 },
            s2: Sub2{ flag: false },
            text: "hi"
        };
    }
}
