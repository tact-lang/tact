struct RecursionEnd {
    stop: Bool;
}

struct RecursionMid {
    next: RecursionEnd;
}

struct RecursionStart {
    mid: RecursionMid;
}

contract SimChain {
    root: RecursionStart;

    init() {
        self.root = RecursionStart{
            mid: RecursionMid{
                next: RecursionEnd{
                    stop: true
                }
            }
        };
    }
}