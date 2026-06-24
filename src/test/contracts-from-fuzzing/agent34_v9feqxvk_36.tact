struct OuterLevel {
    inner: Int;
}

contract ParamWithDefault {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{ inner: 44 };
    }
}