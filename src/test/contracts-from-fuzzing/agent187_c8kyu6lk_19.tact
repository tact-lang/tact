struct BuilderStruct {
    b1: Builder;
    b2: Builder;
}

contract StorageBuildersTest {
    data: BuilderStruct;

    init() {
        self.data = BuilderStruct{
            b1: beginCell(),
            b2: beginCell(),
        };
    }
}