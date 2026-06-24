struct UnionStruct {
    intVal: Int?;
    flag: Bool?;
    text: String?;
}

contract StructWithNullDefaults {
    data: UnionStruct;

    init() {
        self.data = UnionStruct{
            intVal: null,
            flag: null,
            text: null
        };
    }
}