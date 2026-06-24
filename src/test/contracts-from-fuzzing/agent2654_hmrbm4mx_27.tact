struct WrapOptional {
    val: Int?;
}

contract TopOptStruct {
    inner: WrapOptional?;

    init() {
        self.inner = null;
    }
}