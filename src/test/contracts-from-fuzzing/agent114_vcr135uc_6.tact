struct Inner {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint256;
    d: String;
    e: Bool;
}

struct Wrapper {
    val: Inner;
    label: String;
}

contract SerializeFormats {
    st: Wrapper;

    init() {
        self.st = Wrapper{
            val: Inner{
                a: 10,
                b: 255,
                c: 123456789,
                d: "format",
                e: true
            },
            label: "mixed"
        };
    }
}
