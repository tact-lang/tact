struct X {
    val:Int;
}

contract OptionalAssign {
    maybe: X?;

    init() {
        self.maybe = X{ val: 99 };
    }
}
