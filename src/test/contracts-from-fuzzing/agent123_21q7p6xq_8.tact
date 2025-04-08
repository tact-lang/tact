struct OneOpt { optVal: Int?; }

struct TwoOpts { o1: OneOpt?; o2: Int?; }

contract TestContract {
    vals: TwoOpts;

    init() {
        self.vals = TwoOpts{ o1: OneOpt{ optVal: 10 }, o2: null };
    }
}