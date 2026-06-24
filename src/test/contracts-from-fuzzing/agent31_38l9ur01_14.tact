struct HasEmptyOpt {
    text: String?;
}

contract TestContract {
    field: HasEmptyOpt;

    init() {
        self.field = HasEmptyOpt{
            text: null,
        };
    }
}