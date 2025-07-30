// struct with optional slice and optional cell
struct OptRefs {
    s: Slice?;
    c: Cell?;
}

contract NestedRefOpts {
    val: OptRefs;

    init() {
        self.val = OptRefs{
            s: null,
            c: null,
        };
    }
}
