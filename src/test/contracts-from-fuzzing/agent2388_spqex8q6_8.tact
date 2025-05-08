struct Nested {
    i: Int;
    flag: Bool;
    text: String;
}

struct OuterOption {
    nest: Nested?;
}

contract OptionOnStruct {
    param: OuterOption;

    init() {
        self.param = OuterOption{
            nest: null
        };
    }
}