struct InnerLevel {
    x: String;
}
struct MidLevel {
    inner: InnerLevel?;
}
struct OuterLevel {
    mid: MidLevel?;
}

contract OuterOptNestedTest {
    st: OuterLevel;

    init() {
        self.st = OuterLevel{
            mid: null
        };
    }
}
