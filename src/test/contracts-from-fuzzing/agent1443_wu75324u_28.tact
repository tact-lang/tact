struct DefaultsAllOpt {
    a: Int?; // implicit default null
    b: String?; // implicit default null
    c: Bool?; // implicit default null
}

contract EmptyAssignAllDefaults {
    val: DefaultsAllOpt;

    init() {
        self.val = DefaultsAllOpt{};
    }
}