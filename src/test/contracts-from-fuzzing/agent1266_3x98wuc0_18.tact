struct OptStructField {
    sfield: Inner?;
}

struct Inner {
    x: Int;
}

contract OptStructFld {
    val: OptStructField;
    init() {
        self.val = OptStructField{
            sfield: null
        };
    }
}