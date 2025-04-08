struct AllNullables {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s_opt: AllNullables?;

    init() {
        self.s_opt = null;
    }
}
