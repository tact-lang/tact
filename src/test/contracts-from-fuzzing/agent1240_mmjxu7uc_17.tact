contract SetOptionalValues {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: 123,
            b: true,
            c: "present"
        };
    }
}

struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}
