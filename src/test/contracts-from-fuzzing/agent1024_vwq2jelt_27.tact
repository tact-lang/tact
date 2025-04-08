struct NestedOptDefaults {
    val: Int = 1;
    opt: Bool?;
    opt2: Int? = null;
}

contract OptDefaultsTest {
    nested: NestedOptDefaults;

    init() {
        self.nested = NestedOptDefaults{val:2, opt:true, opt2:null};
    }
}