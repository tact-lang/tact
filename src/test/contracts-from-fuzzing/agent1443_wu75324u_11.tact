struct BigOptional {
    val: Int?;
    str: String?;
    flag: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    msg: String?;
    value: Int?;
}

contract ManyOptionals {
    field: BigOptional;

    init() {
        self.field = BigOptional{
            val: null,
            str: null,
            flag: null,
            nested: null,
        };
    }
}