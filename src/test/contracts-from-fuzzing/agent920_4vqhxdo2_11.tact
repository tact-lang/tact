struct A {
    val: Int;
}

contract DefaultOptionalTest {
    data: A?;

    init() {
        self.data = null;
    }
}