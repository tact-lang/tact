struct OptionalNested {
    nested: Int?;
}

struct ContainOpt {
    inner: OptionalNested?;
}

contract OptionalStructInStruct {
    data: ContainOpt;

    init() {
        self.data = ContainOpt{
            inner: null
        };
    }
}