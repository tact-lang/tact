struct Nested {
    z: Int;
    w: Bool;
}

struct Deep {
    inner: Nested;
    msg: String;
    flag: Bool;
}

contract TestContract {
    info: Deep;

    init() {
        self.info = Deep{
            inner: Nested{z: 1, w: true},
            msg: "test",
            flag: false,
        };
    }
}