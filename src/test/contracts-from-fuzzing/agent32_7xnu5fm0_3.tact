struct ManyOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract TestContract {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            intOpt: null,
            boolOpt: true,
            strOpt: null
        };
    }
}