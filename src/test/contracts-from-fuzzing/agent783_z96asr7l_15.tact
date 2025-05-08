struct Some {
    a: Int;
}

contract InitOverDefault {
    val: Some = Some{ a: 5 };

    init() {
        self.val = Some{ a: 42 };
    }
}