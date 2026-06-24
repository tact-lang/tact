struct FieldDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
    d: Int?;  // implicitly null
}

contract TestContract {
    val: FieldDefaults;

    init() {
        self.val = FieldDefaults{ };
    }
}