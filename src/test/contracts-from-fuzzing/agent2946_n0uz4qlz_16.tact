struct Inner {
    val: Int;
}

contract OptWithStruct {
    field: Inner?;
    init() {
        self.field = null;
    }
}