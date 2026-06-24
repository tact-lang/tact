struct Sub {
    s: String?;
    b: Bool?;
}

struct Mid {
    m: Sub;
}

struct Top {
    t: Mid;
}

contract TestContract {
    info: Top;
    init() {
        self.info = Top{
            t: Mid{
                m: Sub{
                    s: null,
                    b: null
                }
            }
        };
    }
}