// Field order incorrectness test
contract OrderTest {
    foo: Int = 1;
    bar: Int;

    init() {
        self.bar = 2;
    }
}