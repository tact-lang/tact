struct InnerStruct {
    val: Int;
}

contract OptionalStructHolder {
    inner: InnerStruct?;

    init() {
        self.inner = InnerStruct{
            val: 555
        };
    }
}