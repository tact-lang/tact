struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Inner;
    value: Int;
    flag: Bool;
    name: String;
    
    init() {
        self.data = Inner{a: 1, b: true};
        self.value = 5;
        self.flag = false;
        self.name = "hello";
    }
}