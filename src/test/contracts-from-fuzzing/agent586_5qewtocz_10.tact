struct InnerOptional {
    field1: Int?;
    field2: String?;
}

struct MidOptional {
    part: InnerOptional;
    note: String;
}

struct OuterOptional {
    top: MidOptional;
    done: Bool?;
}

contract DeepOptionalChain {
    chain: OuterOptional;

    init() {
        self.chain = OuterOptional{
            top: MidOptional{
                part: InnerOptional{ field1: null, field2: null },
                note: "hello"
            },
            done: null
        };
    }

    receive() {
        self.chain = self.chain;
    }
}