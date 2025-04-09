struct SOpt {
    n: Int?;
    b: Bool?;
    s: String?;
}

struct ContainerOpt {
    s1: SOpt;
    s2: SOpt;
    msg: String;
}

contract Test16 {
    x: ContainerOpt;
    init() {
        self.x = ContainerOpt{
            s1: SOpt{ n: null, b: true, s: null },
            s2: SOpt{ n: 5, b: null, s: "val" },
            msg: "hello"
        };
    }
}
