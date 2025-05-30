struct Info {
    num: Int;
    bl: Bool;
}

contract OptionalStruct {
    data: Info?;
    init() {
        self.data = null;
    }
}