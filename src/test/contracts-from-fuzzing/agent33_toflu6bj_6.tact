struct InnerOpt {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

struct BigContainer {
    fixed: Int;
    nested: InnerOpt;
}

contract TestContract {
    data: BigContainer;

    init() {
        self.data = BigContainer{
            fixed: 10,
            nested: InnerOpt{
                optInt: null,
                optBool: null,
                optAddress: null
            }
        };
    }
}