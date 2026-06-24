struct InnerOpt {
    field: Int?;
}

contract DefaultOptStruct {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{ field: null };
    }
}