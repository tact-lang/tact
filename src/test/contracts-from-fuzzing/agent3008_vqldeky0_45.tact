struct A { x: Int?; }

contract OptionStructTop {
    data: A?;

    init() {
        self.data = null;
    }
}