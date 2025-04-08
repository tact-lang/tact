struct Small {
    a: Int;
}

struct WrapOpt {
    small: Small?;
}

contract Test5 {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            small: null,
        };
    }
}