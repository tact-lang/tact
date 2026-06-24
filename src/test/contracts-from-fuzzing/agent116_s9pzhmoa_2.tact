struct SingleBool { flag: Bool }

contract SingleBoolContract {
    s: SingleBool;

    init() {
        self.s = SingleBool{ flag: true };
    }
}