struct Opt1 { x: Int?; }
struct Opt2 { y: Bool?; }
struct Opt3 { o: Opt2?; }

struct Combo {
    a: Opt1;
    b: Opt3;
    c: Opt2;
}

contract NestedStructs {
    s: Combo;

    init() {
        self.s = Combo{
            a: Opt1{ x: null },
            b: Opt3{ o: null },
            c: Opt2{ y: false },
        };
    }
}