struct Layers1 {
    nxt: Layers2;
}
struct Layers2 {
    nxt: Layers3?;
}
struct Layers3 {
    nxt: Layers4?;
}
struct Layers4 {
    val: Int;
}

contract TestContract {
    top: Layers1;

    init() {
        self.top = Layers1 {
            nxt: Layers2 {
                nxt: null,
            },
        };
    }
}