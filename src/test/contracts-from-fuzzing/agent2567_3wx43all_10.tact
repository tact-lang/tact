struct Internal {
    x: Int;
    y: Bool;
}

struct External {
    inner: Internal;
    s: String;
}

contract DefaultsAndAssigned {
    field: External;
    
    init() {
        self.field = External{
            inner: Internal{x: 33, y: false},
            s: "hi"
        };
    }
}