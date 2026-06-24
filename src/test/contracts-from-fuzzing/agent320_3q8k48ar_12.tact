struct MiniInfo {
    u: Int as uint3;
    v: Int as uint5;
}

contract OptSerStruct {
    info: MiniInfo?;
    init() {
        self.info = MiniInfo{ u: 5, v: 15 };
    }
}