struct S { a: Int }

contract ManyAssignments {
    val: S;
    init() {
        self.val = S{ a:1 };
        self.val = S{ a:2 };
        self.val = S{ a:3 };
    }
}