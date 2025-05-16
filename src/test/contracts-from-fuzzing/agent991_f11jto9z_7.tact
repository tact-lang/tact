struct InnerOpt {
    label: String?;
    status: Bool;
}

struct OutOpt {
    inner: InnerOpt?;
    count: Int;
}

contract PartialNestedInit {
    store: OutOpt;

    init() {
        self.store = OutOpt{
            inner: InnerOpt{
                label: null,
                status: true
            },
            count: 42
        };
    }
}