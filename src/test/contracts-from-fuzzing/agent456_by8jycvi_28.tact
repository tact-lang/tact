struct OptionalWithDefaultNulls {
    a: Int? = null;
    b: String? = null;
}

contract OptDefNulls {
    data: OptionalWithDefaultNulls;
    
    init() {
        self.data = OptionalWithDefaultNulls{};
    }
}