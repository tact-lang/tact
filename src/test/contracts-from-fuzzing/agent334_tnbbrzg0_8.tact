struct InnerOpt {
    x: Int?;
    y: String?;
}
struct OuterOpt {
    i: Int;
    inner: InnerOpt?;
}
contract OptContract {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            i: 1,
            inner: InnerOpt{x: null, y: "hi"}
        };
    }
}