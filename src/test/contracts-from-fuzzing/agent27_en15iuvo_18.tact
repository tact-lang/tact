struct S { a: Int }

contract Reassign {
    s: S;

    init() {
        self.s = S{ a: 1 };
        self.s = S{ a: 2 };
    }
}