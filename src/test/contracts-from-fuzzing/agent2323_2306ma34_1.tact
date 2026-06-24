struct SingleOptional {
    foo: Int?;
    bar: Bool;
}

contract SingleOptTest {
    so: SingleOptional;

    init() {
        self.so = SingleOptional{
            foo: null,
            bar: true,
        };
    }
}