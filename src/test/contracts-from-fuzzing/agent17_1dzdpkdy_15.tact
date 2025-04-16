struct Deep1 {
    x: Int as uint8;
    y: Int?;
}

struct Deep2 {
    inner: Deep1;
    flag: Bool;
}

struct Deep3 {
    nested: Deep2?;
    s: String;
}

contract TestContract {
    value: Deep3;

    init() {
        self.value = Deep3{
            nested: null,
            s: "hi"
        };
    }
}