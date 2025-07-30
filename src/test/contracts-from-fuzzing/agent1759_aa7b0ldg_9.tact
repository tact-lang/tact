// optional struct as persistent var
struct OptionalStruct {
    val: Int;
}

contract TestContract {
    maybe: OptionalStruct?;

    init() {
        self.maybe = null;
    }

    receive() {}
}