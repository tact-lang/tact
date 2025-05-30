struct T {
    a: Int = 7;
    b: Bool = true;
}

contract DefaultsViaStruct {
    t: T;

    init() {
        self.t = T{};
    }
}