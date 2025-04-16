struct InnerBool {
    flag: Bool;
}

contract BoolStructStorage {
    data: InnerBool;

    init() {
        self.data = InnerBool{ flag: true };
    }
}