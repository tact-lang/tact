struct BuilderTest {
    b: Builder;
    bo: Builder?;
}

contract BuildersInside {
    val: BuilderTest;

    init() {
        self.val = BuilderTest {
            b: beginCell(),
            bo: null,
        };
    }
}