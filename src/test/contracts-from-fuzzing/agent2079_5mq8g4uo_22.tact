struct Variant {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract TestContract {
    data: Variant;
    init() {
        self.data = Variant{s: "x", i:null, b:true};
    }
}