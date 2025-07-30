struct Inner {
    x: Int?;
    y: Bool?;
}

contract NestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            x: 777,
            y: null,
        };
    }

    receive() {
        let _ = self.data.x;
        let _ = self.data.y;
    }
}