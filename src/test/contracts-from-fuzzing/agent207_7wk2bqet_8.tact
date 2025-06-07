struct OptStrTest {
    s1: String?;
    s2: String;
}

contract Test8 {
    field: OptStrTest;
    init() {
        self.field = OptStrTest{
            s1: null,
            s2: "not null"
        };
    }
}