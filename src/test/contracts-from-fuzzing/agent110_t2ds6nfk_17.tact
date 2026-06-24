struct Small {
    flag: Bool = false;
    note: String;
}

contract TestContract {
    val: Small;
    init() {
        self.val = Small{note: "hello"};
    }
}