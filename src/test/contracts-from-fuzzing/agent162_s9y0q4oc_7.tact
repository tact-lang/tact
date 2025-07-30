struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract Combo {
    val: Int;
    flag: Bool;
    data: S;

    init() {
        self.val = 1;
        self.flag = false;
        self.data = S{ a: 2, b: true, c: null };
    }
}