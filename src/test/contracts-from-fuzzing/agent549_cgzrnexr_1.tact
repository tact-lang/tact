struct Inner {
    x: Int;
    y: Bool;
    z: Int?;
}

contract Test {
    myField: Inner;

    init() {
        self.myField = Inner{
            x: 1,
            y: true,
            z: null,
        };
    }

    receive() {
        self.myField = Inner{
            x: 2,
            y: false,
            z: 42,
        };
    }
}