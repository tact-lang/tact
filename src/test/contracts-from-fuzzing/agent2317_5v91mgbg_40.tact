struct BigOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract LargeOptionStruct {
    val: BigOpt;

    init() {
        self.val = BigOpt{a:null,b:null,c:null,d:null};
    }
}