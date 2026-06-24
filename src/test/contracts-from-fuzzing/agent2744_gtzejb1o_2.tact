struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsContract {
    opt: WithOptionals;

    init() {
        self.opt = WithOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}
