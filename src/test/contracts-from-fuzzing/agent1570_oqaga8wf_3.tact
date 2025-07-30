struct OptionalHolder {
    val: Int?;
    flag: Bool?;
}

contract OptTest {
    state: OptionalHolder;

    init() {
        self.state = OptionalHolder{ val: null, flag: true };
    }
}