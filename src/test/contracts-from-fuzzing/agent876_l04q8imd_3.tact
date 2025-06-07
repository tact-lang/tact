struct OptionalNest {
    f1: Int?;
    f2: Bool?;
}

struct ContainsOptionalNest {
    nested: OptionalNest?;
    flag: Bool;
}

contract OptNestedContract {
    persistent: ContainsOptionalNest;

    init() {
        self.persistent = ContainsOptionalNest{
            nested: OptionalNest{
                f1: null,
                f2: true,
            },
            flag: false,
        };
    }

    receive() {
        if (self.persistent.nested != null) {
            dump(self.persistent.nested!!.f2);
        }
    }
}