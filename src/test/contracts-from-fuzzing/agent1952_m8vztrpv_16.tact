struct NestedAddressOpt {
    inner: InnerOpt;
}

struct InnerOpt {
    a: Address?;
}

contract TestContract {
    data: NestedAddressOpt;

    init() {
        self.data = NestedAddressOpt{
            inner: InnerOpt{
                a: null,
            },
        };
    }
}
