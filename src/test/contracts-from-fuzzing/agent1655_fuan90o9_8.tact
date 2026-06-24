struct NestedOptionalStruct {
    name: String;
    data: NestedOptionalStruct2?;
}

struct NestedOptionalStruct2 {
    number: Int;
    flag: Bool;
}

contract OptStructField {
    persist: NestedOptionalStruct;

    init() {
        self.persist = NestedOptionalStruct {
            name: "hi",
            data: null
        };
    }
}
