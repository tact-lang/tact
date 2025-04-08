struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    val: OptStruct;

    init() {
        self.val = OptStruct{ a:null, b:null, c:null };
    }
}