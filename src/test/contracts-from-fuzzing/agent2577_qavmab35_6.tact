struct OptionalDeep {
    nestedOpt: Param?;
    flag: Bool;
}

struct Param {
    field: Data;
}

struct Data {
    num: Int;
    text: String;
}

contract OptionNest {
    store: OptionalDeep;

    init() {
        self.store = OptionalDeep{
            nestedOpt: null,
            flag: true,
        };
    }
}
