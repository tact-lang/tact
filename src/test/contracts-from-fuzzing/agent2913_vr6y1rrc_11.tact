struct SOpt {
    s1: Int?;
    s2: Bool?;
}

struct SNestOpt {
    so: SOpt;
    flag: Bool;
}

contract OptInNested {
    val: SNestOpt;

    init() {
        self.val = SNestOpt{
            so: SOpt{
                s1: null,
                s2: null,
            },
            flag: true,
        };
    }
}