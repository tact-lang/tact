struct OptStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: "hello",
            c: true
        };
    }
}