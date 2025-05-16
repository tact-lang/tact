struct Mid1 { f1: Int; }
struct Mid2 { f2: Bool; }
struct Mid3 { f3: String; }

struct Combo {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
    optS: String?;
    flag: Bool;
}

contract TestComboNested {
    data: Combo;

    init() {
        self.data = Combo{
            m1: Mid1{ f1: 10 },
            m2: Mid2{ f2: true },
            m3: Mid3{ f3: "hello" },
            optS: null,
            flag: false,
        };
    }
}
