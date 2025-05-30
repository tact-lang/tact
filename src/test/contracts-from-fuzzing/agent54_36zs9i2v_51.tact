struct BoolIntOpt {
    b: Bool;
    i: Int?;
}
contract NestedBoolIntOpt {
    data: BoolIntOpt;
    init() {
        self.data=BoolIntOpt{b:true,i:null};
    }
}