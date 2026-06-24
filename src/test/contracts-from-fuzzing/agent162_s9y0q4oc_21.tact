struct ContainsBoolAndOptional {
    x: Bool;
    y: Bool?;
}

contract TestContract {
    data: ContainsBoolAndOptional;

    init() {
        self.data = ContainsBoolAndOptional{
            x: false,
            y: null
        };
    }
}