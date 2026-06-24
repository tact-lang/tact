struct InnerOpt2 {
    flag: Bool?;
}

struct OuterOpt2 {
    inner: InnerOpt2?;
    title: String;
}

contract OptionalNestingTest {
    store: OuterOpt2;

    init() {
        self.store = OuterOpt2{
            inner: null,
            title: "nest opt"
        };
    }
}
