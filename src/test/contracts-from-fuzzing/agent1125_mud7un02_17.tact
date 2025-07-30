struct WithString {
    foo: String;
    bar: String;
}

contract TestContract {
    w: WithString;

    init() {
        self.w = WithString{
            foo: "foo",
            bar: "bar",
        };
    }
}