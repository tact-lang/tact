struct ContainsBool {
    flag: Bool;
}

contract BoolFieldTest {
    data: ContainsBool;

    init() {
        self.data = ContainsBool{
            flag: true
        };
    }
}