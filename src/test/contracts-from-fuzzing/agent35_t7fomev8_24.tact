struct OptStr {
    s1: String?;
    s2: String?;
}

struct HasOptStr {
    inner: OptStr;
    count: Int;
}

contract TestContract {
    payload: HasOptStr;
    init() {
        self.payload = HasOptStr{
            inner: OptStr{
                s1: null,
                s2: "ok",
            },
            count: 3
        };
    }
}
