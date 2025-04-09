struct OptOpt {
    val1: Int?;
    val2: Bool?;
    val3: Cell?;
    val4: Slice?;
    val5: String?;
}

struct ContainOpt {
    optField: OptOpt?;
    count: Int;
}

contract OptionalContainingOptional {
    state: ContainOpt;

    init() {
        self.state = ContainOpt{
            optField: null,
            count: 55,
        };
    }
}
