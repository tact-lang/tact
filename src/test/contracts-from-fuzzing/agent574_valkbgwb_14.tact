struct Inner {
    val: Int;
    name: String = "foo";
    flag: Bool = false;
}

struct Mixed {
    count: Int = 5;
    enabled: Bool?;
    label: String;
    nested: Inner?;
}

contract ComplexOneField {
    meta: Mixed;

    init() {
        self.meta = Mixed{
            enabled: null,
            label: "my label",
            nested: null
        };
    }

    receive() {
        if (self.meta.nested != null) {
            dump(self.meta.nested!!.val);
        }
    }
}