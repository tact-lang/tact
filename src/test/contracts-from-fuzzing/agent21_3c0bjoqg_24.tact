struct Weird {
    a: Int? as uint32 = null;
    b: Int? as int64 = null;
}

contract TestContract {
    weird: Weird = Weird{};

    init() {
        self.weird = Weird{};
    }
}