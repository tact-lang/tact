struct Foo {
    bar: Int?;
}

contract NullableStructField {
    fooOpt: Foo?;

    init() {
        self.fooOpt = null;
    }
}