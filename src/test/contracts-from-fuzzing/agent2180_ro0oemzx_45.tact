struct Wrapper {
    s: String?;
}

contract OmittedOptDefault {
    data: Wrapper;

    init() {
        self.data = Wrapper{};
    }
}