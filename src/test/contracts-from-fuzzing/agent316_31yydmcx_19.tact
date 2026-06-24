struct Deep {
    x: Int as int8;
    y: Int as uint64;
}

struct Wrap {
    inner: Deep;
    flag: Bool;
}

contract SerializeNest {
    value: Wrap;

    init() {
        self.value = Wrap{
            inner: Deep{ x: -5, y: 1000000 },
            flag: true
        };
    }
}