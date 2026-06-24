struct Inner {
    val: Int;
    label: String;
}

struct Nested1 {
    x: Int;
    inn: Inner;
}

struct Nested2 {
    arr1: Nested1;
    arr2: Nested1;
}

contract MultiNested {
    data: Nested2;
    init() {
        self.data = Nested2{
            arr1: Nested1{ x: 2, inn: Inner{ val: 5, label: "foo" } },
            arr2: Nested1{ x: 3, inn: Inner{ val: 7, label: "bar" } }
        };
    }
}