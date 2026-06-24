struct InnerBool {
    b: Bool;
}

contract BoolStructField {
    val: InnerBool;

    init() {
        self.val = InnerBool{b:true};
    }
}
