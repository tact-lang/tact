struct NestedOpt {
    f1: Int?;
    f2: String?;
}

struct HasNestedOpt {
    inner: NestedOpt?;
}

contract NestedOptionalField {
    data: HasNestedOpt;

    init() {
        self.data = HasNestedOpt{ inner: null };
    }
}