struct Inner {
    rest: Slice as remaining;
}

struct Outer {
    message: String;
    maybeAddress: Address?;
    chunk: Inner;
}

contract TestContract {
    content: Outer;

    init() {
        self.content = Outer{
            message: "data",
            maybeAddress: null,
            chunk: Inner{ rest: emptyCell().asSlice() }
        };
    }
}