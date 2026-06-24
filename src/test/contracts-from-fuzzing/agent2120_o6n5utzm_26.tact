struct WrapOpt {
    x: Int?;
}

contract ReassignOptional {
    f: WrapOpt;
    init() {
        self.f = WrapOpt{ x:null };
    }
}