struct Duplicate1 {
    foo: Int = 1;
    bar: String = "a";
}

struct Duplicate2 {
    foo: Int = 2;
    bar: String = "b";
}

contract SameStructFields {
    data: Duplicate1;

    init() {
        self.data = Duplicate1{};
    }

    receive() { dump(self.data.foo); }
}