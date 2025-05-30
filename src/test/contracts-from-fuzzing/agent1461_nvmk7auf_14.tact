struct InnerMostOpt {
    val: Int?;
}

struct L2Opt {
    inner: InnerMostOpt?;
}

struct L1Opt {
    inner: L2Opt?;
}

contract DeepOpt {
    data: L1Opt;

    init() {
        self.data = L1Opt{
            inner: L2Opt{
                inner: InnerMostOpt{
                    val: 777
                }
            }
        };
    }
}