struct MultiOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract TestOptionals {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            intOpt: 10,
            boolOpt: null,
            stringOpt: "hello"
        };
    }
}