// struct with mix of default, optional and required fields
struct Combo {
    val1: Int = 5;
    val2: Int?;
    val3: Bool = true;
    val4: String? = null;
    val5: Bool? = false;
    val6: String;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            val2: 42,
            val6: "x"
        };
    }
}