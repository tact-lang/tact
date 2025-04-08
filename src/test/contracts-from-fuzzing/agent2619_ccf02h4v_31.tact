struct ComplexDefault {
    x: Int = 7;
    y: Bool = true;
    z: String = "hi";
}

contract ComplexDefaultCont {
    s: ComplexDefault;
    init() {
        self.s = ComplexDefault{ x: 10, y: false, z: "hello" };
    }
}