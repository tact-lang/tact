struct EdgeDefault {
    x: Int = 0;
    y: Bool = false;
    s: String = "";
}

contract DefaultsContract {
    vals: EdgeDefault;

    init() {
        self.vals = EdgeDefault{};
    }
}