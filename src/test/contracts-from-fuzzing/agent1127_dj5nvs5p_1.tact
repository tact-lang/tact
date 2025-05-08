struct Inner {
    flag: Bool;
    text: String;
    num: Int;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{
            flag: true,
            text: "hello",
            num: 42,
        };
    }
}
