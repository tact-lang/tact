struct PartialOpt {
    a: Int? = 1;
    b: Bool?;
    c: String? = "yes";
}

contract PartialDefaultOpt {
    s: PartialOpt = PartialOpt{
        b: null,
    };

    init() {
        self.s = PartialOpt{
            b: true,
        };
    }
}