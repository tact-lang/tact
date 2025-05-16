// optional Builder persistent variable (known to be problematic in structs but test in contract)
contract TestContract {
    b: Builder?;

    init() {
        self.b = beginCell();
    }
}