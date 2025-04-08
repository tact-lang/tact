contract OptionalStructField {
    val: Data?;
    
    init() {
        self.val = null;
    }
}

struct Data {
    num: Int;
    flag: Bool;
}