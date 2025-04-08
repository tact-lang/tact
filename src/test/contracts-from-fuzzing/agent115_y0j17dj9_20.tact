struct NestOpt {
    a: Int?;
    b: Bool?;
}

struct OuterNestOpt {
    nested: NestOpt?;
    msg: String;
}

contract NullableStructs {
    dat: OuterNestOpt;

    init() {
        self.dat = OuterNestOpt{
            nested: null,
            msg: "empty"
        };
    }
}