struct FPTest {
    foo: Int;
    bar: Bool;
    baz: String?;
}

contract PunningInit {
    val: FPTest;
    
    init() {
        let foo = 123;
        let bar = true;
        let baz: String? = null;
        self.val = FPTest{
            foo,
            bar,
            baz,
        };
    }
}
