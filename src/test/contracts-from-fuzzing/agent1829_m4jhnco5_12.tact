struct Defaults {
    x: Int = 4;
    y: Bool = true;
}

contract TestContract {
    init() {
        let d = Defaults{};
    }
}