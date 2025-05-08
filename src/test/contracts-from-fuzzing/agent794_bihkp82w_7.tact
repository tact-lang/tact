struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract TestOptStruct {
    optSt: OptStruct = OptStruct{ a: null, b: null, s: null, addr: null };
    init() {}
}