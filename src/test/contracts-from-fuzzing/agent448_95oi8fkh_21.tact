struct BuilderTest {
    a: Builder;
    b: Builder?;
}

contract BuilderTestContract {
    data: BuilderTest;

    init() {
        self.data = BuilderTest{
            a: beginCell(),
            b: null,
        };
    }

    receive() {}
}