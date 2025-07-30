struct EmptyOptStruct {
    optional: OptionStruct?;
}

struct OptionStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructInside {
    val: EmptyOptStruct;

    init() {
        self.val = EmptyOptStruct{
            optional: null
        };
    }
}