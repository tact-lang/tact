struct OptStringBool {
    s: String?;
    b: Bool?;
}

contract TestContract {
    val: OptStringBool;

    init() {
        self.val = OptStringBool{s:null, b:null};
    }

    receive() {}
}