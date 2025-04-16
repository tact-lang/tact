message(1) Ping { when: Int }
message(2) Pong { when: Int }

struct MultiOpt {
    p1: Ping?;
    p2: Pong?;
    desc: String?;
}

contract MultipleOptionals {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            p1: null,
            p2: null,
            desc: null,
        };
    }
}