struct SDefault {
    a: Int = 5;
    b: Int = 10;
}

contract TestDefaults {
    data: SDefault;
    init() {
        self.data = SDefault{}; // use defaults
    }
}