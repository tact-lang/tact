struct OptStr {
    a: String?;
}

contract OptStrTest {
    data: OptStr;

    init() {
        self.data = OptStr{
            a: null
        };
    }
}