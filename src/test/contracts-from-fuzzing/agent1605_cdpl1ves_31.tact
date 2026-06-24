struct InnerBool {
    flag: Bool;
}

contract PersistentStructWithBool {
    data: InnerBool;

    init() {
        self.data = InnerBool{
            flag: true
        };
    }
}