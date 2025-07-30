struct StructOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    s: StructOpt;

    init() {
        self.s = StructOpt{
            a: null,
            b: null
        };
    }
}