struct Tiny {
    x: Int as uint1;
}

struct Wrap {
    inner: Tiny;
}

contract TinyStorage {
    payload: Wrap;

    init() {
        self.payload = Wrap{
            inner: Tiny{
                x: 1
            }
        };
    }
}