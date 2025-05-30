// Optional struct value stored in contract persistent state
struct OptStructOptional {
    val: Int;
}

contract TestContract {
    optVal: OptStructOptional?;

    init() {
        self.optVal = null;
    }
}