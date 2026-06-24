struct EmbeddedNullable {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract ContractWithEmbedded {
    data: EmbeddedNullable;

    init() {
        self.data = EmbeddedNullable{
            i: null,
            s: "abc",
            b: true,
        };
    }
}