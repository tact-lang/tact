struct InnerBoolStruct {
    val: Bool;
}

contract BoolStructContract {
    inner: InnerBoolStruct;

    init() {
        self.inner = InnerBoolStruct{
            val: true
        };
    }
}