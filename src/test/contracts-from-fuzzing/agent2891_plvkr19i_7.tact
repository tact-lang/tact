struct Bar {
    value: Int;
}

struct Foo {
    bar: Bar?; // Optional nested struct
    text: String;
}

contract OptionalStructField {
    data: Foo;

    init() {
        self.data = Foo{
            bar: null,
            text: "hi"
        };
    }
}