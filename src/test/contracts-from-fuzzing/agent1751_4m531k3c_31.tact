trait HasData {
    info: Int;
}

contract OverrideTrait with HasData {
    info: Int;

    init() {
        self.info = 100;
    }

    receive() {}
}