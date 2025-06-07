struct InnerStruct {
    flag: Bool;
    amount: Int;
}

contract NestedStructField {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{flag: true, amount: 100};
    }
}