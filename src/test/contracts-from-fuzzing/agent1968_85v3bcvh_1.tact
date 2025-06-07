struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test2 {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{a:null,b:null,c:null};
    }
}