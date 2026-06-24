struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct Container {
    bigOpt: BigStruct?;
}

contract BigOptionalField {
    data: Container;

    init() {
        self.data = Container{
            bigOpt: null
        };
    }
}