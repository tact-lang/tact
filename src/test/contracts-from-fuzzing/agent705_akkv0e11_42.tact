struct StrBool {
    s: String;
    b: Bool;
}

struct WrapperOpt {
    inner: StrBool?;
}

contract NullableStructInStruct {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{ inner: null };
    }
}