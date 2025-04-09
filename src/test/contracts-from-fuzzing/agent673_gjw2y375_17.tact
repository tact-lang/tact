// nested optional with initializer assigning inner value
struct Foo {
    val: Int;
}

contract TestContract {
    nestedOpt: Foo?;

    init() {
        self.nestedOpt = Foo{val: 42};
    }
}