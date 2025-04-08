contract SingleDefaultsOptionals {
    data: SingleFieldStruct;

    init() {
        self.data = SingleFieldStruct{};
    }
}

struct SingleFieldStruct {
    label: String = "hello";
    flag: Bool? = null;
}
