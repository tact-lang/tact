struct WrapperBool {
    flag: Bool;
}

contract OptionalStructField {
    w: WrapperBool?;

    init() {
        self.w = WrapperBool{ flag: true };
    }
}