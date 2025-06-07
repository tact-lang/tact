struct SingleStringDefault {
    s: String = "test";
}

contract StringDefaultField {
    data: SingleStringDefault;
    init() {
        self.data = SingleStringDefault{};
    }
}