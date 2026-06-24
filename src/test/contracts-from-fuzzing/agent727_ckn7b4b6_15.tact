struct MaybeInner {
    s: Int?;
    t: String?;
}

contract OptStructContract {
    data: MaybeInner?;

    init() {
        self.data = MaybeInner{
            s: null,
            t: "hello"
        };
    }
}
