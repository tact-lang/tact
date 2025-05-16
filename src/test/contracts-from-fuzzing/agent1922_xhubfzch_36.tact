struct HasBuilder {
    builder: Builder;
}

contract BuilderInStorage {
    s: HasBuilder;

    init() {
        self.s = HasBuilder{
            builder: beginCell()
        };
    }
}