struct SubOptStruct {
    value: String?;
}

contract OptStructField {
    val: SubOptStruct?;

    init() {
        self.val = null;
    }
}