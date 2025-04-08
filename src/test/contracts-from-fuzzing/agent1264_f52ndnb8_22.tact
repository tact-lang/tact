struct SDefault {
    n: Int = 1;
    s: String = "x";
}

contract SDefaultContract {
    data: SDefault;
    init() {
        self.data = SDefault{};
    }
}