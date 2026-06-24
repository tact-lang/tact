struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract DeepOpt {
    opt: MultiOpt?;

    init() {
        self.opt = MultiOpt{ a:null, b:true, c:null, d:null };
    }
}