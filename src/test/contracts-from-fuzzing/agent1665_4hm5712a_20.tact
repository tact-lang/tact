struct HasBuilder {
    b1: Builder;
    b2: Builder?;
}

contract Test20 {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{
            b1: beginCell(),
            b2: null
        };
    }
}