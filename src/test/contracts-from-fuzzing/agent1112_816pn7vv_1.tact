struct Wrapper {
    inner: Int?;
    flag: Bool;
}

contract Test {
    data: Wrapper;
    init() {
        self.data = Wrapper{inner: null, flag: true};
    }
}