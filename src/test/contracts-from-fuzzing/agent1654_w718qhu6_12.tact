struct OptOptOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    first: OptOptOpt?;
    second: OptOptOpt?;
}

contract OptionalsCluster {
    storage: Container?;

    init() {
        self.storage = Container{
            first: null,
            second: OptOptOpt{
                a: null,
                b: true,
                c: null
            }
        };
    }
}