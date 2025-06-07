struct Simple {
    val: Int;
}

// Contract combines persistent var + getter + uses optional of struct
contract CombineOptionals {
    optVal: Simple?;

    init() {
        self.optVal = null;
    }
}