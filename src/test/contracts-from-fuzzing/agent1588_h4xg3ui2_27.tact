struct OptSerialize {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptSerTest {
    s: OptSerialize;
    
    init() {
        self.s = OptSerialize{
            a: null,
            b: null,
            c: null,
        };
    }
}