struct DefStruct {
    val: Int = 42;
    label: String = "hello";
}

contract OptionalStructDefaulted {
    content: DefStruct?;

    init() {
        self.content = null;
    }
}