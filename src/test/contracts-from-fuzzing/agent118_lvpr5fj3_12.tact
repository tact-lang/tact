struct ComposeOpt {
    x: Int?;
    nested: Compose2;
}

struct Compose2 {
    y: Bool?;
}

contract ComposeContract {
    data: ComposeOpt;

    init() {
        self.data = ComposeOpt{
            x: null,
            nested: Compose2{ y: true }
        };
    }
}