struct Inner {
    flag: Bool;
    text: String;
    amount: Int as uint32;
}

contract VariousTypes {
    sfield: Inner;
    isActive: Bool;
    counter: Int;
    username: String;
    maybeVal: Int?;

    init() {
        self.sfield = Inner{flag: true, text: "abc", amount: 42};
        self.isActive = false;
        self.counter = 0;
        self.username = "user";
        self.maybeVal = null;
    }

    receive() {
        self.counter += 1;
    }
}