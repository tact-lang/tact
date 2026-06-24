struct A {
    flag: Bool;
}

struct B {
    inner: A?;
    text: String;
}

contract NestedOptional {
    val: B;

    init() {
        self.val = B{
            inner: null,
            text: "hi"
        };
    }
}