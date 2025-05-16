struct OptWrap {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptTest {
    data: OptWrap;

    init() {
        self.data = OptWrap{
            s: null,
            n: null,
            b: true,
        };
    }
}