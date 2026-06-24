struct Sub {
    x: Int;
}

contract OptAssignNull {
    val: Sub?;

    init() {
        self.val = null;
    }
}