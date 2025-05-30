struct WithOptionals {
    num: Int?;
    flag: Bool?;
    msg: String?;
}

contract TestContract {
    vals: WithOptionals;

    init() {
        self.vals = WithOptionals{
            num: null,
            flag: true,
            msg: null
        };
    }
}