struct BigStringOpt {
    name: String?;
    data: String?;
    comment: String?;
}

contract OptStrs {
    info: BigStringOpt;

    init() {
        self.info = BigStringOpt{
            name: null,
            data: null,
            comment: null
        };
    }
}