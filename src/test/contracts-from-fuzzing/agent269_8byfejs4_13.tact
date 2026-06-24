struct Holder {
    a: Int?;
    b: Bool?;
    c: String?;
    sub: Nested?;
}

struct Nested {
    val: Int;
}

contract OptionalsInStruct {
    storage: Holder;

    init() {
        self.storage = Holder{ a:null, b:null, c:null, sub:Nested{val:7} };
    }
}