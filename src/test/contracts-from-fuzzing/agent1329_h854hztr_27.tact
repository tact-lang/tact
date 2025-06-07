struct Sub {
    a: Int;
}

contract OptTopStruct {
    val: Sub?;

    init() {
        self.val = null;
    }
}
