struct NestedOptionalStruct {
    opt: Int?;
}

struct OuterOptional {
    inner: NestedOptionalStruct?;
}

contract OptionalStructInOptionalField {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ inner: null };
    }

    receive() {
        if (self.field.inner != null) {
            let inr = self.field.inner!!;
            if (inr.opt != null) {
                inr.opt = inr.opt!! + 1;
            } else {
                inr.opt = 0;
            }
            self.field.inner = inr;
        } else {
            self.field.inner = NestedOptionalStruct{ opt: 0 };
        }
    }
}