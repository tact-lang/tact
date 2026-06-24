struct OptBool {
    flag: Bool?;
}

contract Test {
    data: OptBool;

    init() {
        self.data = OptBool{
            flag: null
        };
    }
}