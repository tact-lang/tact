struct WithOptionalAndDefault {
    num: Int? = null;
    flag: Bool = false;
}

contract OptDefContract {
    data: WithOptionalAndDefault;

    init() {
        self.data = WithOptionalAndDefault{
            num: null,
            flag: true
        };
    }
}
