struct OptOpt {
    a: Int?;
    b: Bool?;
}

contract OptOptContract {
    data: OptOpt;

    init() {
        self.data = OptOpt{
            a:null, b:null
        };
    }
}