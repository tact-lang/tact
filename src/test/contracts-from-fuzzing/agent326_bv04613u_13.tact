struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Wrap {
    wrapped: DeepOptionals;
}

contract OptWrapped {
    data: Wrap;

    init() {
        self.data = Wrap{
            wrapped: DeepOptionals{
                a: null,
                b: null,
                c: null,
                d: null
            }
        };
    }
}
