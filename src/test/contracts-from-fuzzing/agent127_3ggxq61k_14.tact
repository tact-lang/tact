struct HasBool {
    flag: Bool;
}

contract BoolStructField {
    data: HasBool;
    init() {
        self.data = HasBool{ flag: true };
    }
}