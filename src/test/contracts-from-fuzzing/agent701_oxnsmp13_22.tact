struct Tiny {
    x: Int;
}

contract OptionalThenAssign {
    val: Tiny? = null;

    init() {
        self.val = Tiny{ x:3 };
    }
}