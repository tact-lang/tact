struct Leaf {
    val: Int;
}

struct MidOpt {
    left: Leaf?;
    right: Leaf?;
}

struct TopOpt {
    branch: MidOpt?;
}

contract DeepOptContract {
    data: TopOpt;

    init() {
        self.data = TopOpt{
            branch: MidOpt{
                left: Leaf{ val: 1 },
                right: null
            }
        };
    }
}
