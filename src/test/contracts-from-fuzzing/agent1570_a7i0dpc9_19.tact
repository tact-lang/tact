struct ComposeSliceString {
    data: Slice;
    text: String;
}

contract TestContract {
    foo: ComposeSliceString;
    init() {
        self.foo = ComposeSliceString{
            data: emptyCell().asSlice(),
            text: "hello"
        };
    }
}