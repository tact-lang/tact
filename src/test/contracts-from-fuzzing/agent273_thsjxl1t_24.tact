struct Flag {
    on: Bool = true;
    label: String = "flag";
}

contract Test24 {
    f: Flag;

    init() {
        self.f = Flag{};
    }
}