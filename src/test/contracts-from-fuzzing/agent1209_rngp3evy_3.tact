struct DefaultOpt {
    a: Int?;
    b: Bool?;
}

contract TestOpt {
    val: DefaultOpt;
    init() {
        self.val = DefaultOpt{
            a: null,
            b: null
        };
    }
}