struct NestedParam {
    flag: Bool;
    count: Int;
}

contract DeeplyNestedTest {
    data: NestedParam;
    
    init() {
        self.data = NestedParam{
            flag: true,
            count: 42,
        };
    }
}