struct SingleBool { flag: Bool; }
contract TestContract {
    s: SingleBool;
    init() {
        self.s = SingleBool{ flag: true };
    }
}