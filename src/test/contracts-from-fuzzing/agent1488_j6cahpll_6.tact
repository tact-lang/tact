struct OptionalInStruct {
    val: Int?;
    flag: Bool;
    text: String?;
    cellVal: Cell?;
}

contract OptStructField {
    item: OptionalInStruct;

    init() {
        self.item = OptionalInStruct{
            val: null,
            flag: true,
            text: null,
            cellVal: null
        };
    }
}
