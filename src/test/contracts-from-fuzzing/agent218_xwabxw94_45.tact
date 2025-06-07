struct Deep {
    amount: Int as coins;
    flag: Bool?;
    note: String = "Δ";
}

struct Outer {
    val: Int;
    info: Deep;
    extra: String?;
}

contract ComplexStorage {
    state: Outer;

    init() {
        self.state = Outer{
            val: 10,
            info: Deep{ amount: ton("1.5"), flag: null, note: "ß" },
            extra: "漢"
        };
    }
}