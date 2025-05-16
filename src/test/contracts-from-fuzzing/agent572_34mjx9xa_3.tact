struct Bar {
    val: Int = 5;
    flag: Bool = false;
}

contract Foo {
    barOpt: Bar?;

    init() {
        self.barOpt = Bar{
            val: 123,
            flag: true
        };
    }
}