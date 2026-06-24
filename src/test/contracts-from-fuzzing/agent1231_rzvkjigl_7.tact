struct OptNested {
    inner: Int?;
    flag: Bool?;
    txt: String?;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            inner: null,
            flag: true,
            txt: null
        };
    }
}
