// optional nested inside optional
struct InnerOpt {
    f: Int?;
}

struct OuterOpt {
    g: InnerOpt?;
}

contract TestContract {
    persist: OuterOpt;

    init() {
        self.persist = OuterOpt{ g: null };
    }
}