struct OptBools {
    a: Bool?;
    b: Bool?;
}

contract TestContract {
    data: OptBools;

    init() {
        self.data = OptBools{};
    }

    receive() {
        let _ = self.data.a;
    }
}