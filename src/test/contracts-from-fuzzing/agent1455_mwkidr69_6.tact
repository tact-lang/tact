struct BigNested {
    alpha: Int;
    beta: Beta;
    gamma: Gamma;
}

struct Beta {
    x: Int;
    y: Delta;
}

struct Gamma {
    flag: Bool;
    message: String;
}

struct Delta {
    info: String;
    ok: Bool?;
}

contract TestBigNested {
    bignest: BigNested;

    init() {
        self.bignest = BigNested{
            alpha: 10,
            beta: Beta{
                x: 20,
                y: Delta{
                    info: "info",
                    ok: true,
                }
            },
            gamma: Gamma{
                flag: false,
                message: "msg"
            }
        };
    }
}
