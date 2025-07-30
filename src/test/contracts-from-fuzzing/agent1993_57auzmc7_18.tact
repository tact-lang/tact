struct SubLevel {
    value: Int;
}

contract DeepOpt {
    field: SubLevel?;

    init() {
        self.field = SubLevel{ value: 11 };
    }
}