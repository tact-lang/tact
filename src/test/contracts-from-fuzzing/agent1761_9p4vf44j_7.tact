struct OptionalStruct {
    optionalField: SubStruct?;
}

struct SubStruct {
    someString: String;
    someInt: Int;
}

contract TestContract {
    state: OptionalStruct;

    init() {
        self.state = OptionalStruct{
            optionalField: null
        };
    }
}