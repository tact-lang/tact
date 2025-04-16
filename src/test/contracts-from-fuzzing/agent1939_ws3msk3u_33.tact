struct First {
    f: Int;
}
struct Second {
    s: String;
}
struct Third {
    t: Bool;
}
struct Combo {
    one: First;
    two: Second;
    three: Third;
}
contract ComboTest {
    mixed: Combo;
    init() {
        self.mixed = Combo{
            one: First{f:1},
            two: Second{s:"hi"},
            three: Third{t:true}
        };
    }
}