struct OptionalDeep {
    inner: Int?;
    other: Address?;
}

struct ContainerOpt {
    wrap1: OptionalDeep?;
    wrap2: OptionalDeep?;
    wrap3: OptionalDeep?;
}

contract TestContract {
    deepOpt: ContainerOpt;

    init() {
        self.deepOpt = ContainerOpt{
            wrap1: OptionalDeep{inner:1, other:null},
            wrap2: null,
            wrap3: OptionalDeep{inner:null, other:myAddress()}
        };
    }
}