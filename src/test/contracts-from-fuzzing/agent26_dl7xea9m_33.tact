struct NestedS {
    a: Int?;
    b: Bool;
}

contract Defaults {
    s: NestedS = NestedS{a:null, b:true};
    init() {
        self.s = NestedS{a:7, b:false};
    }
}