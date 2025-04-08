struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            innerOpt: Inner {
                value: null
            }
        };
    }

    receive() {
        if (self.data.innerOpt != null) {
            let innerVal = self.data.innerOpt!!.value;
            if (innerVal != null) { dump(innerVal!!); }
        }
    }
}
