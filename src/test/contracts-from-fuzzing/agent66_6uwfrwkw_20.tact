struct ABool {
    flag: Bool;
}

contract StructBool {
    st: ABool;

    init() {
        self.st = ABool{ flag: true };
    }
}