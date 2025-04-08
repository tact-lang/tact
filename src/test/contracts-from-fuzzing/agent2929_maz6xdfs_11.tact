struct A {
    x: Int = 1;
    y: Bool = true;
    z: String;
}

contract PartialInit {
    data: A;

    init() {
        self.data = A{
            z: "filled"
        };
    }
}