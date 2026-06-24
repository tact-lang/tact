struct AStruct {
    a: Int = 1;
}

contract HasStruct {
    s: AStruct;
    init() {
        self.s = AStruct{};
    }
}
