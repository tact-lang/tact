struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    storage: OptionalStruct;

    init() {
        self.storage = OptionalStruct{ a:null, b:true, c:null };
    }
}
