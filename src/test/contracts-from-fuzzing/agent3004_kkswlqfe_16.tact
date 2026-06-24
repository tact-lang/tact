struct InnerOpt {
    s: String?;
}

contract FieldOptStruct {
    inner: InnerOpt?;

    init() {
        self.inner = null;
    }
}