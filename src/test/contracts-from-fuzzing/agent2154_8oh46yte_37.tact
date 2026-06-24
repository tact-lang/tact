struct OuterOpt {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract NestedOptField {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{inner1:null, inner2:true, inner3:null};
    }
}