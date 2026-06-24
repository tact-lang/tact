// struct with inner defaults plus optional field
struct SI {
    x: Int = 5;
    y: Int? = null;
}
contract MixDefaultsOpt {
    s: SI;
    init() {
        self.s = SI{};
    }
}