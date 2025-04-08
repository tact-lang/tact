struct SDeep {
    inner: MDeep;
}

struct MDeep {
    inner: LDeep;
}

struct LDeep {
    text: String;
    flag: Bool;
}

contract ThreeDeep {
    data: SDeep;

    init() {
        self.data = SDeep{
            inner: MDeep{
                inner: LDeep{
                    text: "hey",
                    flag: true
                }
            }
        };
    }
}