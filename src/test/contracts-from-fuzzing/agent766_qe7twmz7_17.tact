struct OptStruct1 {
    a: Int?;
    b: String?;
}

struct OptStruct2 {
    c: Address?;
    d: Bool?;
}

contract ManyOptionalsTop {
    s1: OptStruct1? = null;
    s2: OptStruct2? = null;
    s3: OptStruct1? = null;
    s4: OptStruct2? = null;

    init() {
        // leave all null
    }
}