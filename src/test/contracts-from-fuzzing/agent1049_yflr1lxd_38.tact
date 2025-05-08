struct DeepOpt {
    x: Int?;
    y: Bool?;
}

contract DeepDefaultedOpt {
    f1: DeepOpt? = null;
    f2: DeepOpt? = null;

    init() {
        self.f1 = DeepOpt{ x:5, y:null };
        self.f2 = null;
    }
}