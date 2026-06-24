struct Info {
    x: Int? = null;
    y: String? = null;
}

contract TestContract {
    info: Info?;
    init() {
        self.info = null;
    }
}