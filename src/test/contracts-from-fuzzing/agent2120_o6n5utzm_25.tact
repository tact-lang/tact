struct NestedMany {
    a: Int; b: Int?; c: Bool; d: String?; e: Int; f: Bool?;
}

contract NestedManyContract {
    storage: NestedMany;
    init() {
        self.storage = NestedMany{
            a:1, b:null, c:true, d:null, e:5, f:null
        };
    }
}