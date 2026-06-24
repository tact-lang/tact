struct Inner {
    flag: Bool;
    note: String;
}

contract TestContract {
    maybeInner: Inner? = null;

    init() {
        self.maybeInner = Inner{flag: true, note: "ok"};
    }
    receive() {}
}
