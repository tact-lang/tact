struct Nested {
    inner: MyStruct;
}

struct MyStruct {
    x: Int;
    y: Int;
}

contract Test {
    receive() {
        let s: Nested = Nested { inner: MyStruct { x: 1, y: 2 } };
    }
}