struct BigOpt {
    x: Int?;
    y: Int?;
    z: Int?;
    w: Int?;
}

contract TestContract {
    opt: BigOpt;

    init() {
        self.opt = BigOpt{
            x: null,
            y: null,
            z: null,
            w: null,
        };
    }
}