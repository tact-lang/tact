struct Details {
    info: String? = null;
    mark: Int? = null;
    active: Bool? = null;
    rate: Int = 0;
}

struct Container {
    meta: Details = Details{};
    status: Bool = true;
}

contract ComplexNestedDefaults {
    data: Container = Container{};
    init() {}
}