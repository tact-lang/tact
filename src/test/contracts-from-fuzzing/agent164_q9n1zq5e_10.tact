struct Foo {
    name: String = "x";
    count: Int = 42;
    note: String?;
}

contract TestContract {
    data: Foo = Foo{
        note: null,
    };

    receive() {
        let _ = self.data.name;
    }
}