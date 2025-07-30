struct Inner {
    data: Slice as remaining;
}

struct Outer {
    prefix: Int;
    embedded: Inner;
    suffix: String;
}

contract TestContract {
    persist: Outer;

    init() {
        self.persist = Outer{
            prefix: 1,
            embedded: Inner{ data: emptyCell().asSlice() },
            suffix: "after"
        };
    }
}