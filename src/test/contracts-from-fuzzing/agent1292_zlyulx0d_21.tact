struct WrappedString {
    inner: String;
}

struct HasWrapped {
    w: WrappedString;
}

contract WrapContract {
    store: HasWrapped;

    init() {
        self.store = HasWrapped{
            w: WrappedString{ inner: "hello" },
        };
    }
}