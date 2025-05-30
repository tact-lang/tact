// Struct chain with optional fields and defaults
struct DefOptInner {
    id: Int = 0;
    label: String?;
}

struct DefOptOuter {
    inner: DefOptInner?;
    note: String = "note";
}

contract DefaultOptionals {
    val: DefOptOuter;

    init() {
        self.val = DefOptOuter{
            inner: null,
            note: "changed"
        };
    }
}