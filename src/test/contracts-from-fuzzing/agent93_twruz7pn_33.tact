struct InnerOpt {
    name: String?;
    level: Int?;
}

contract NestedNullOptionals {
    info: InnerOpt?;

    init() {
        self.info = InnerOpt{
            name: null,
            level: null,
        };
    }
}