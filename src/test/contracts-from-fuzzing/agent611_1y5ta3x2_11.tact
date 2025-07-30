struct Defaults {
    foo: Int = 7;
    bar: Bool = false;
    str: String = "abc";
    opt: Address? = null;
}

struct OuterDef {
    nested: Defaults;
}

contract CDef {
    val: OuterDef;

    init() {
        self.val = OuterDef{
            nested: Defaults{},
        };
    }
}