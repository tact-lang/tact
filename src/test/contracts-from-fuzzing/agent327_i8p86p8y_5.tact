struct OptStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptTest {
    data: OptStruct = OptStruct{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null
    };
    init() {}
}