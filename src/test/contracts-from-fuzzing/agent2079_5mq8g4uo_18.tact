struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    val: MultiOptional;
    init() {
        self.val = MultiOptional{a: null, b: null, c: null};
    }
}