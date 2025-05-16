struct Small {
    addr: Address?;
}

struct Big {
    inner: Small?;
    count: Int;
}

contract TestContract {
    data: Big;
    init() {
        self.data = Big{ inner: null, count: 42 };
    }
}