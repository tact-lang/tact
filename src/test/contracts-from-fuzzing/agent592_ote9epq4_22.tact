struct Inner {
    z: Int;
}

struct Meta {
    inner: Inner?;
}

struct Envelope {
    meta: Meta;
}

contract TestContract {
    payload: Envelope?;

    init() {
        self.payload = Envelope{ meta: Meta{ inner: null } };
    }

    receive() {}
}