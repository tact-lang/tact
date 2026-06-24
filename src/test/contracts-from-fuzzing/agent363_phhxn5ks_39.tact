message M {}

contract TestContract {
    field: M?;

    init() {
        self.field = null;
    }

    receive() {}
}