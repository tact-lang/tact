struct OptionalStruct {
    xx: Int;
    yy: Bool;
}

contract TestContract {
    val: OptionalStruct?;
    init() {
        self.val = OptionalStruct{
            xx: 77,
            yy: false
        };
    }
}
