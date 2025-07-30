// Nested struct chain with one missing default, explicit init of innermost
struct Bottom {
    x: Int;
}
struct Mid {
    btm: Bottom;
    msg: String = "test";
}
struct Top {
    m: Mid;
}

contract TestContract {
    field: Top;

    init() {
        self.field = Top{
            m: Mid{
                btm: Bottom{x:7}
            }
        };
    }
}