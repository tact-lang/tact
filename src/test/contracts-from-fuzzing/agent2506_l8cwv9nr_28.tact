struct Compose1 {
    flag: Bool;
}

struct Compose2 {
    inner: Compose1;
    optStr: String?;
}

contract ComposeTest {
    data: Compose2;

    init() {
        self.data = Compose2{
            inner: Compose1{ flag: true },
            optStr: null,
        };
    }
}
