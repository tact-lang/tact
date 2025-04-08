struct Sub {
    a: Int = 1;
    b: Bool = true;
}

contract StructStorage {
    subField: Sub;

    init() {
        self.subField = Sub{ a: 42, b: false };
    }
}