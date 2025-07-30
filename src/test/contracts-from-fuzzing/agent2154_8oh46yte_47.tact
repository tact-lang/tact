struct NestedOptionalStruct {
    val: Int?;
    note: String?;
}

contract NestedOptionalContract {
    field: NestedOptionalStruct;

    init() {
        self.field = NestedOptionalStruct{val:null, note:null};
    }
}