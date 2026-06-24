struct InnerStruct {
    val: Int;
    note: String?;
}

contract OptionalNested {
    data: InnerStruct? = null;

    init() {
        self.data = InnerStruct{ val: 654, note: "exists" };
    }
}