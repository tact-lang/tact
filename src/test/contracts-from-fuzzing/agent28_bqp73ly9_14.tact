struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct ComposeOpt {
    inner: MultiOption?;
}

contract StructsWithOptStructOpt {
    s: ComposeOpt;

    init() {
        self.s = ComposeOpt{
            inner: null
        };
    }
}