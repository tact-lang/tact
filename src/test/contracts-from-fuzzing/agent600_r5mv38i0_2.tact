struct InnerStruct {
    val1: Int;
    flag: Bool;
}

contract NestedStructField {
    data: InnerStruct = InnerStruct{val1: 5, flag: true};

    receive() {
        let d = self.data;
    }
}