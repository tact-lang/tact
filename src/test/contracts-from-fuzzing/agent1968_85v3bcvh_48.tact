struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    d: Int?;
    e: Bool?;
}

contract Test49 {
    val: DeepOpt;
    init() {
        self.val = DeepOpt{
            a:null,
            b:null,
            c:InnerOpt{d:null,e:null}
        };
    }
}