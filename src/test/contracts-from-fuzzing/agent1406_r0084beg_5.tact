struct OptStruct {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            s: null,
            i: null,
            b: null,
        };
    }
}
