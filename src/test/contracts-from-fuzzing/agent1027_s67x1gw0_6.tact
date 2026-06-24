struct Deep {
    level: Int;
    inner: Inner;
}

struct Inner {
    text: String;
    optInt: Int?;
}

contract MultiLevel {
    deep: Deep;

    init() {
        self.deep = Deep{
            level: 5,
            inner: Inner{
                text: "data",
                optInt: null
            }
        };
    }
}