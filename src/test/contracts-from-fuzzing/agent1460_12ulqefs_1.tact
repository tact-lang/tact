struct OptionalHolder {
    val: Int?;
}

contract TestContract {
    data: OptionalHolder;

    init() {
        self.data = OptionalHolder{ val: null };
    }
}