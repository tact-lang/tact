struct Thing {
    a: Int;
    b: Bool;
}

contract MultiAssign {
    data: Thing;

    init() {
        let temp = Thing{ a: 7, b: false };
        self.data = temp;
    }
}