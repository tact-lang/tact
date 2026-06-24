struct OptionalNest {
    flag: Bool;
    label: String?;
    num: Int?;
}

contract Test {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{ flag:true, label:null, num:null };
    }
}