struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    myData: Inner;

    init() {
        self.myData = Inner{
            x: 7,
            y: true,
            z: "hello",
        };
    }

    receive() {}
}