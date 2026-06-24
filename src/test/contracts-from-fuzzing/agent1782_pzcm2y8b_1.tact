struct S1 {
    x: Int;
    y: Int?;
    z: String;
}

contract TestContract {
    point: S1;

    init() {
        self.point = S1{
            x: 1,
            y: null,
            z: "hello",
        };
    }
}