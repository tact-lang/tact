struct DeepOpt {
    aa: Int?;
    bb: Bool?;
    cc: Inner?;
}

struct Inner {
    inn: Int?;
}

contract OptInit {
    dd: DeepOpt;

    init() {
        self.dd = DeepOpt{ aa:null, bb:null, cc:null };
    }
}
