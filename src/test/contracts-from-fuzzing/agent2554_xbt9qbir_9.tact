struct OptDef {
    a: Int;
    b: Int?;
}

contract OptDefaultTest {
    s: OptDef;

    init() {
        self.s = OptDef{
            a: 42
            // omit 'b' entirely
        };
    }
}