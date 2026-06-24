struct DeepOpt {
    val: Int?;
    nestedOpt: String?;
}

contract DeepOptContract {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{ val:null, nestedOpt:null };
    }
}
