struct InnerOptDefault {
    n: Int? = null;
    f: Bool = true;
}

contract DefaultOptionalStructField {
    data: InnerOptDefault;

    init() {
        self.data = InnerOptDefault{};
    }
}