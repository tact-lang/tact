struct Maybe {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    opt: Maybe;
    init() {
        self.opt = Maybe {
            val: null,
            flag: true,
        };
    }
}