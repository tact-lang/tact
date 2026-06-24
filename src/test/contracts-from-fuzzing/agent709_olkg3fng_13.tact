struct DefaultsOpt {
    count: Int?;           // default = null implicit
    note: String? = null;  // explicit default null
}

contract TestContract {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};  // use defaults
    }
}