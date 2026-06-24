struct Boolie {
    fine: Bool;
}

contract JustBoolStruct {
    tiny: Boolie;

    init() {
        self.tiny = Boolie{ fine: true };
    }
}
