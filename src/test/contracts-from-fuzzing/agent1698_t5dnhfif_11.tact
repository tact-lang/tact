struct OptionNest {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct HasOptionStruct {
    foo: Int;
    bar: OptionNest?;
}

contract Test {
    v: HasOptionStruct;
    init() {
        self.v = HasOptionStruct{foo: 7, bar: null};
    }
}