struct SingleBool {
    b: Bool;
}

contract SingleBoolContract {
    b: Bool;
    s: SingleBool;

    init() {
        self.b = true;
        self.s = SingleBool{ b: false };
    }
}