// optional struct fields with default non-null values
struct OptStruct {
    i: Int? = 7;
    s: String? = "hi";
    b: Bool? = false;
}

contract TestContract {
    f: OptStruct;
    init() {
        self.f = OptStruct{};
    }
}
