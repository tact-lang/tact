struct OptionalLayer {
    foo: Int?;
    bar: Bool?;
}

struct ContainsOptionals {
    innerOpt: OptionalLayer;
    x: Int;
}

contract NestedOptionals {
    optContainer: ContainsOptionals;

    init() {
        self.optContainer = ContainsOptionals{
            innerOpt: OptionalLayer{foo:null, bar:true},
            x: 777
        };
    }
}