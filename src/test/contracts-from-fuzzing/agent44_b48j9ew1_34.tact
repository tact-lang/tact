struct Small {
    s: Int;
}

struct Holder {
    inner: Small?;
}

contract OptionalStructField {
    h: Holder;

    init() {
        self.h = Holder{ inner: null };
    }

    receive() {
        self.h = Holder{ inner: Small{ s: 5 } };
    }
}