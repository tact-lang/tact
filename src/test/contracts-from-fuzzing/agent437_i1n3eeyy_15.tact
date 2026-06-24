struct HasBuilder {
    b: Builder;
}

contract BuilderStorage {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{b: beginCell()};
    }

    receive() {
        let _ = self.data.b.endCell();
    }
}