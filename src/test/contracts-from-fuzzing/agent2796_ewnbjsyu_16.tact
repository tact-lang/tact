struct ContainsOptionals {
    f1: Int?;
    f2: Bool?;
}

struct OuterContainer {
    nested: ContainsOptionals;
    b: Bool;
}

contract OuterContainerContract {
    container: OuterContainer;

    init() {
        self.container = OuterContainer{
            nested: ContainsOptionals{ f1: null, f2: null },
            b: false
        };
    }
}