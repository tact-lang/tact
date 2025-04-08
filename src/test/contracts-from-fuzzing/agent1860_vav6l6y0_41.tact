struct A {
    x: Int;
    y: Int;
}

contract AssignPriority {
    val: A = A{ x: 1, y: 2 };

    init() {
        self.val.x = 100;
    }
}