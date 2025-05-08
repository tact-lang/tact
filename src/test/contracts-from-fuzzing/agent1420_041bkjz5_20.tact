struct OptHolder {
    val: Int?;
}

contract TestContract {
    holder: OptHolder;

    init() {
        self.holder = OptHolder{ val: null };
    }
}