struct IntEnums {
    RED: Int = 0;
    GREEN: Int =1;
    BLUE: Int=2;
}

contract EnumContract {
    col: Int = 1;  // Assign one of enum values

    init() {
        self.col = 2;
    }
}