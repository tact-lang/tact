struct OptStruct {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract OptContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null
        };
    }
}