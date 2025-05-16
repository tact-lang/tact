struct InitTest {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    val: InitTest;

    init() {
        self.val = InitTest{
            foo: 42,
            bar: true,
        };
    }

    receive() {
        self.val = InitTest{
            foo: 17,
            bar: false,
        };
    }
}