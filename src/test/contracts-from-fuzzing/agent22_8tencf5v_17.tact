// Persistent variable nested struct chain with no defaults
struct In2 {
    val: Int;
}

struct In1 {
    nested: In2;
}

struct Top {
    inner: In1;
}

contract Chain {
    link: Top;

    init() {
        self.link = Top{
            inner: In1{
                nested: In2{ val: 123 }
            }
        };
    }
}