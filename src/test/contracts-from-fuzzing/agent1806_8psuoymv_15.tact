struct DeepOpt {
    o1: Int?;
    o2: Bool?;
}

struct Level1 {
    s1: DeepOpt;
    s2: DeepOpt;
}

contract DeepOptTest {
    state: Level1;
    init() {
        self.state = Level1{
            s1: DeepOpt{o1:null, o2:true},
            s2: DeepOpt{o1:42, o2:null}
        };
    }
}