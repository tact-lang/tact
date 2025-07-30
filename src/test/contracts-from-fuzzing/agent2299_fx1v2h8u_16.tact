struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct HasOpt {
    nested: Opts;
}

contract NestedOptionals {
    val: HasOpt = HasOpt{
        nested: Opts{
            a: null,
            b: null,
            c: true,
        }
    };
}