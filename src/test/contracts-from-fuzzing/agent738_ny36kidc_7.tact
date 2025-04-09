struct NestedOptStruct {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract NestedOptPersistent {
    persistentOpt: NestedOptStruct?;

    init() {
        self.persistentOpt = NestedOptStruct{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}