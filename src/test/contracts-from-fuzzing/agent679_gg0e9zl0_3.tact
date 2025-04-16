struct Wrapper {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    s4: Int?;
    s5: Int?;
    s6: Int?;
    s7: Int?;
    s8: Int?;
    s9: Int?;
    s10: Int?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            s1: null,
            s2: null,
            s3: null,
            s4: null,
            s5: null,
            s6: null,
            s7: null,
            s8: null,
            s9: null,
            s10: null,
        };
    }
}