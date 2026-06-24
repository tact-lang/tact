struct OptStruct {
    val: Int;
    txt: String;
}

contract PersistenceOptionalStruct {
    data: OptStruct?;

    init() {
        self.data = OptStruct{
            val: 314,
            txt: "optional",
        };
    }
}