struct OptStr {
    s: String?;
    b: Bool;
}

contract StrOptTest {
    data: OptStr;

    init() {
        self.data = OptStr{
            s: null,
            b: true,
        };
    }

    receive() {
        let _ = self.data;
    }
}