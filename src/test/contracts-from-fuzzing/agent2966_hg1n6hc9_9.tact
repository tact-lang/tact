struct NullableInner {
    x: Int?;
    y: String?;
}

struct NullableOuter {
    nested: NullableInner?;
    z: Bool;
}

contract NullableStack {
    persist: NullableOuter;

    init() {
        self.persist = NullableOuter{
            nested: NullableInner{
                x: null,
                y: "hi",
            },
            z: true,
        };
    }
}
