struct NestedAddressOptional {
    nested: NestedInner?;
}

struct NestedInner {
    addr: Address?;
}

contract TestContract {
    s: NestedAddressOptional;
    init() {
        self.s = NestedAddressOptional{
            nested: NestedInner{
                addr: null
            }
        };
    }
}