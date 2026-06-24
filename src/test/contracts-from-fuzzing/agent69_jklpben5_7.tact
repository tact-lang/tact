struct WithString {
    longStr: String;
    optStr: String?;
}

contract StringStorageTest {
    s: WithString;
    
    init() {
        self.s = WithString{
            longStr: "this is quite a long string just to test",
            optStr: null
        };
    }
}