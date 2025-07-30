struct Shallow {
    x: Int;
}

contract ShallowStructStorage {
    data: Shallow;

    init() {
        self.data = Shallow{ x: 99 };
    }
}
