struct Inner2 {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Inner {
    lvl2: Inner2?;
}

struct DeepOpt {
    lvl1: Inner?;
}

contract TestContract {
    rec: DeepOpt;

    init() {
        self.rec = DeepOpt{
            lvl1: Inner{
                lvl2: Inner2{
                    x: null,
                    y: null,
                    z: null,
                }
            }
        };
    }
}