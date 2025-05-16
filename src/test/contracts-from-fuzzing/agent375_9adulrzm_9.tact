struct ListWithDefaults {
    one: Int = 1;
    two: Int = 2;
    three: Int = 3;
    four: Int = 4;
    five: Int = 5;
    six: Int = 6;
    seven: Int = 7;
    eight: Int = 8;
    nine: Int = 9;
    ten: Int = 10;
}

contract TestContract {
    data: ListWithDefaults;

    init() {
        self.data = ListWithDefaults{};
    }
}
