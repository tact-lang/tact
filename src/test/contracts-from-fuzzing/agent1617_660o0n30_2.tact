struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract DeepNestedTest {
    inner: Inner;
    number: Int;
    flag: Bool;
    
    init() {
        self.inner = Inner{ val1: 7, val2: false, val3: "hi" };
        self.number = 5;
        self.flag = true;
    }
}
