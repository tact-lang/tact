struct Details {
    desc: String;
    score: Int;
}

contract TestContract {
    info: Details?;

    init() {
        self.info = null;
    }
}