struct Foo {
    flag: Bool = false;
    text: String = "foo";
}

struct Bar {
    num: Int = 10;
    fooVal: Foo = Foo{};
}

contract ComposeDefaults {
    barVal: Bar = Bar{};
}