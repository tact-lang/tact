struct Deep3 {
    x: Int?;
    y: Bool?;
}

struct Deep2 {
    mid: Deep3?;
    val: Int?;
}

struct Deep1 {
    inner: Deep2?;
    flag: Bool?;
}

contract VeryDeepOptionals {
    state: Deep1;

    init() {
        self.state = Deep1{
            inner: null,
            flag: null,
        };
    }
}