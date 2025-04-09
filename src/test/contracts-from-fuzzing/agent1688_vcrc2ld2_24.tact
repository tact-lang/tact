message(303) OptMsg {
    flag: Bool;
    txt: String;
}

contract TestContract {
    optionalData: OptMsg?;

    init() {
        self.optionalData = null;
    }
}