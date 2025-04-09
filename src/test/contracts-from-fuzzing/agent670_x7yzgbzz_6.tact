struct Combo1 {
    val: Int;
    flag: Bool;
}

struct Combo2 {
    count: Int;
    inner: Combo1;
}

contract MultipleNested {
    a: Combo1;
    b: Combo2;

    init() {
        self.a = Combo1{ val: 10, flag: true };
        self.b = Combo2{ count: 5, inner: Combo1{ val: 1, flag: false } };
    }
}