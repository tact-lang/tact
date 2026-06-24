struct NestedParams {
    flag: Bool;
    count: Int;
    text: String;
    optNumber: Int?;
}

contract TestContract {
    params: NestedParams;
    
    init() {
        self.params = NestedParams{
            flag: true,
            count: 42,
            text: "hello",
            optNumber: null
        };
    }
}