struct Inner {
    small: Int as uint4;
    flag: Bool;
}

struct Nested {
    inner: Inner;
    big: Int as int64;
}

contract StorageSerialize {
    f: Nested;
    init() {
        self.f = Nested{
            inner: Inner{ small: 7, flag: true },
            big: 12345678
        };
    }
}