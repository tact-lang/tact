struct ComplexDefaults {
    name: String = "John";
    age: Int?;
    title: String? = "Mr";
    flag: Bool = false;
}

contract TestContract {
    user: ComplexDefaults;
    init() {
        self.user = ComplexDefaults{
            age: null
        };
    }
}
