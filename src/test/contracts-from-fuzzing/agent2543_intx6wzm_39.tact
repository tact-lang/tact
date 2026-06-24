struct InnerOpt {
    s: String?;
    flag: Bool;
}

contract OptTest {
    data: InnerOpt;
    init() {
        self.data = InnerOpt{
            s: null,
            flag: true
        };
    }
}