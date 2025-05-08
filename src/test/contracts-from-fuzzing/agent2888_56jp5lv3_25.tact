// optional string deeply nested through structs
struct Inn {
    s: String?;
}

struct Out {
    inn: Inn;
}

contract DeepStringOpt {
    field: Out;

    init() {
        self.field = Out{
            inn: Inn{
                s: null,
            },
        };
    }
}