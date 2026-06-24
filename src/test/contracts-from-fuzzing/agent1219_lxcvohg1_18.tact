// Complex nested optionals struct stress test
struct DeepOpt {
    x: Int?;
    y: Bool?;
}

struct MidOpt {
    deep1: DeepOpt?;
    deep2: DeepOpt?;
}

struct MasterOpt {
    mid1: MidOpt?;
    mid2: MidOpt?;
}

contract OptFuzz {
    all: MasterOpt;

    init() {
        self.all = MasterOpt{
            mid1: null,
            mid2: MidOpt{
                deep1: null,
                deep2: DeepOpt{ x:null, y:null }
            }
        };
    }
}