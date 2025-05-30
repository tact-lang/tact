struct InnerStruct {
    x: Int = 7;
    y: Bool = false;
    z: String = "abc";
}

contract TestContract {
    point: InnerStruct;
    init() {
        self.point = InnerStruct{};
    }
    receive() {}
}