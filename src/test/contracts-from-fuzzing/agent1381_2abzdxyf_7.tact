struct DeeplyOptionalInner {
    d: Int?;
    e: Bool;
}

struct Hold {
    c: DeeplyOptionalInner?;
}

contract TestContract {
    container: Hold;

    init() {
        self.container = Hold{ c: null };
    }
}