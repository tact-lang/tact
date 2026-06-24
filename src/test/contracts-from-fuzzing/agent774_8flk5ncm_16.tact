struct NestedOpt {
    inner: InnerOpt?;
    flag: Bool?;
}

struct InnerOpt {
    val: Int?;
    txt: String?;
}

contract NullableStructs {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ inner: null, flag: null };
    }
}