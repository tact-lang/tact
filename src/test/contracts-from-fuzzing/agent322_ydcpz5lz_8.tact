struct DeepOpt {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

struct Container {
    fst: DeepOpt;
    snd: DeepOpt;
}

contract Test {
    val: Container;

    init() {
        self.val = Container{
            fst: DeepOpt{
                s1: null, s2: "b", s3: null, s4: "d", s5: null
            },
            snd: DeepOpt{
                s1: "e", s2: null, s3: "g", s4: null, s5: "i"
            }
        };
    }
}