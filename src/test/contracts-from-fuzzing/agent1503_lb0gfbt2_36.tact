struct Foo {
    val: Int;
    flag: Bool?;
}

struct Bar {
    foo: Foo;
    txt: String;
}

contract ParamNested(
    param1: Int,
    param2: Foo,
    param3: Bar
) {
    receive() {}
}