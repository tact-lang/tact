struct DeepChain {
    next: Next?;
}

struct Next {
    next: Next2?;
}

struct Next2 {
    value: Int?;
}

contract ManyLayeredOptionals {
    field: DeepChain;

    init() {
        self.field = DeepChain{next:null};
    }
}