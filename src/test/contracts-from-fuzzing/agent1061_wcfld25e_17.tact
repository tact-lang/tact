// mixture of default values and init assignments
struct Inn { x: Int = 77; txt: String = "abc"; }

contract Test {
    f1: Int = 5;
    f2: Bool;
    f3: String = "";
    f4: Inn;

    init() {
        self.f2 = true;
        self.f4 = Inn{};
    }
}