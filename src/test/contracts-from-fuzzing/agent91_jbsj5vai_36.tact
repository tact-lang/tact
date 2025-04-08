struct SingleBool {
    flag: Bool;
}

contract SingleBoolPersist {
    f: SingleBool;

    init() {
        self.f = SingleBool{ flag: true };
    }
}
