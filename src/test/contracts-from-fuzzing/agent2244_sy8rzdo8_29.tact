struct Chain {
    next: ChainOpt?;
}

struct ChainOpt {
    data: Int?;
    label: String?;
}

contract RecursiveOpt {
    root: Chain;

    init() {
        self.root = Chain{
          next: ChainOpt{
            data: null,
            label: null
          }
        };
    }
}
