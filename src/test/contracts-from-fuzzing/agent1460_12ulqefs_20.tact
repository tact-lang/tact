// Optional struct as a persistent variable
struct OptionalNested {
    val: Int;
}

contract TestContract {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}