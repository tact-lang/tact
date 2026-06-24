struct InnerBool {
    flag: Bool;
}

contract BoolStructContract {
    d: InnerBool;

    init() {
        self.d = InnerBool{ flag:true };
    }
}
