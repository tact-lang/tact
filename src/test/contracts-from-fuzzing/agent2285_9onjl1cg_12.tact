struct Val1 { a: Int; }
struct Val2 { b: Bool; }
struct Val3 { c: String; }
struct Val4 { d: Int?; }
struct Val5 { e: Bool?; }

struct Combo {
    f1: Val1;
    f2: Val2;
    f3: Val3;
    f4: Val4;
    f5: Val5;
}

contract Test12 {
    val: Combo;

    init() {
        self.val = Combo{
            f1: Val1{ a: 3 },
            f2: Val2{ b: false },
            f3: Val3{ c: "x" },
            f4: Val4{ d: null },
            f5: Val5{ e: null },
        };
    }
}