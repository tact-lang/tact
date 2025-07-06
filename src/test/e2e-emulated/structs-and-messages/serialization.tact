message Foo {
    slice: Slice?;
    builder: Builder?;
    string: String?;
}

contract Test {
    slice: Slice?;
    builder: Builder?;
    string: String?;

    receive() {}

    receive(foo: Foo) {
        self.slice = foo.slice;
        self.builder = foo.builder;
        self.string = foo.string;
    }
}
