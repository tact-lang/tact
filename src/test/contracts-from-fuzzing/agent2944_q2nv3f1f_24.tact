struct SDeep {
    lv: Int;
}

struct MDeep {
    left: SDeep;
    right: SDeep;
}

struct TopDeep {
    m: MDeep;
}

contract ChainStorage {
    t: TopDeep;

    init() {
        self.t = TopDeep{
            m: MDeep{
                left: SDeep{lv: 7},
                right: SDeep{lv: 42}
            }
        };
    }
}