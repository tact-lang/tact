struct SDefault {
    a: Int = 123;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    sd: SDefault;

    init() {
        self.sd = SDefault {};
    }
}