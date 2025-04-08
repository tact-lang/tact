struct Defaults {
    id: Int = 100;
    title: String = "default";
    active: Bool = true;
    note: String? = null;
}

contract DefaultsContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}