struct Sub {
    X: Int;
}

struct WithOptionalMap {
    // Map from Int to Sub struct
    Items: map<Int, Sub>;
    // Optional field with nested struct
    Opt: Sub?;
}

contract TestOptionalMap {
    receive() {
        let s: WithOptionalMap = WithOptionalMap {
            Items: emptyMap(),
            Opt: null
        };
        if (s.Opt != null) {
            let _ = s.Opt!!.X;
        }
        return;
    }
}
