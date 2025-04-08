struct SingleBool { b: Bool; }

contract BoolContract {
    data: SingleBool;

    init() {
        self.data = SingleBool{b: true};
    }
}