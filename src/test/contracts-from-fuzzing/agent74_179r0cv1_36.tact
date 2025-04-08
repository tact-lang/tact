struct Mixed {
    name: String;
    small: Int as uint8;
    medium: Int as uint16;
    large: Int;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{ name: "abc", small: 200, medium: 60000, large: 123456789 };
    }
}