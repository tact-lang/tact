struct OptStruct {
    val: Int?;
    txt: String?;
}

contract OptStructStore {
    item: OptStruct;

    init() {
        self.item = OptStruct{
            val: null,
            txt: null
        };
    }
}