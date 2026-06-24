struct B {
    x: Int;
}

contract OptionalStructB {
    val: B?;
    init() {
        self.val = null;
    }
}
