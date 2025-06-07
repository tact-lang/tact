struct HasBuilder {
    b1: Builder;
    b2: Builder;
}

contract TestContract {
    val: HasBuilder;

    init() {
        let b = beginCell();
        self.val = HasBuilder{ b1: b, b2: b };
    }
}