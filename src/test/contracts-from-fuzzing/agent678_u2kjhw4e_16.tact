struct BigNested {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Address;
    s5: Int?;
    s6: Bool;
    s7: String?;
    s8: Address;
    s9: Int;
    s10: Int?;
}

contract TestContract {
    val: BigNested;
    init() {
        self.val = BigNested{
            s1: 1, s2: true, s3: "hi", s4: myAddress(),
            s5: null, s6: false, s7: null, s8: myAddress(),
            s9: 100, s10: null
        };
    }
}