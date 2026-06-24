struct BigDefault {
    withDefault: Int = 777;
}

contract TestContract {
    data: BigDefault;

    init() {
        self.data = BigDefault{};
    }
}