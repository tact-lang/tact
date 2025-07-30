struct Carry {
    a: Int;
    b: Int;
    c: Int;
}

contract ManyAssignments {
    carry: Carry;

    init() {
        self.carry = Carry{ a: 1, b:2, c:3 };
        self.carry = Carry{ a: 4, b:5, c:6 };
    }
}