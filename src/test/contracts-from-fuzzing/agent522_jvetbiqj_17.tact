struct StrNest {
    s: String;
    inner: Int;
}

contract StringInStruct {
    data: StrNest;

    init() {
        self.data = StrNest{
            s: "data",
            inner: 77,
        };
    }
}