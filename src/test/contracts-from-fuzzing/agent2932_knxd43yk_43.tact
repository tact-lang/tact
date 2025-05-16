struct DefBeforeUse {
    x: Int = 5;
}

contract ReassignDefaults {
    val: DefBeforeUse;
    init() {
        self.val = DefBeforeUse{ x: 12 };
    }
}