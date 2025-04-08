struct Inner {
    y: Int;
    flag: Bool;
}

contract NestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            y: 1,
            flag: true,
        };
    }
}