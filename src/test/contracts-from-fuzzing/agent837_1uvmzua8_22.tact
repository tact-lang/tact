struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract OptStruct {
    val: HasOptionals;
    init() {
        self.val = HasOptionals{ a:null, b:null, c:null };
    }
}