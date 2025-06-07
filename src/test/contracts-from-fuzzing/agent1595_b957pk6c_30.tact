// Contract with multiple fields, Int/String/optionals with default init
contract TestContract {
    v1: Int = 1;
    v2: String = "s";
    v3: Bool = false;
    v4: Int?;
    v5: String?;

    init() {
        self.v4 = null;
        self.v5 = "non-null";
    }
}