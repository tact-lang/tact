struct SInner {
    f: Int = 5;
}

contract DefaultInnerStruct {
    data: SInner;
    init() {
        self.data = SInner{};
    }
}