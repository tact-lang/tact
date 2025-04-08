struct WithDefault {
    x: Int = 42;
    y: Bool = true;
    z: String = "hello";
    w: Slice;
}

contract TestContract {
    data: WithDefault;

    init() {
        self.data = WithDefault{
            w: emptyCell().asSlice()
        };
    }
}