struct OptionalStruct {
    val: Int?;
    text: String?;
}

contract StructWithOptionals {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: null,
            text: null
        };
    }
}