struct Inner {
    num: Int?;
    txt: String;
}

contract OptionalFieldStruct {
    data: Inner?;

    init() {
        self.data = null;
    }
}