struct DeepOptionals {
    x: Int?;
    y: Int?;
}

struct HasOptionalStruct {
    nested: DeepOptionals?;
    flag: Bool;
}

contract TestContract {
    state: HasOptionalStruct;

    init() {
        self.state = HasOptionalStruct{
            nested: null,
            flag: true
        };
    }
}