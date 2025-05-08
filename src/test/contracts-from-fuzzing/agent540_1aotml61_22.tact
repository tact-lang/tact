struct Compose1 {
    a: Int;
    b: Bool;
}

struct Compose2 {
    s: Compose1;
    num: Int;
}

contract ComposeTop {
    inner: Compose2;

    init() {
        self.inner = Compose2{
            s: Compose1{ a:1, b:true },
            num: 9
        };
    }
}