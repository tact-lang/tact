struct LongSerialize {
    foo: Int as int64;
    bar: Int as uint64;
    baz: Int as coins;
}

contract SerializeFields {
    data: LongSerialize;

    init() {
        self.data = LongSerialize{
            foo: -123,
            bar: 123,
            baz: ton("1"),
        };
    }
}