struct OptDefault {
    a: Int?;
    b: String?;
}

contract OptDefaultTest {
    s: OptDefault;

    init() {
        self.s = OptDefault{
            a:null,
            b:null,
        };
    }
}