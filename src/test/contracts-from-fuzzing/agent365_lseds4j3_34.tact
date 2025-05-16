struct A {
    val: Int;
    inner: B;
}

struct B {
    text: String;
}

contract Compose {
    a: A;

    init() {
        self.a = A{
            val: 5,
            inner: B{ text: "abc" }
        };
    }
}