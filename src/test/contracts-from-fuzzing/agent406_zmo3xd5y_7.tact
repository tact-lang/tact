struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "yes";
    o: Int? = null;
    p: Bool? = false;
    q: String? = "hmm";
}

contract DefaultVals {
    rec: Defaults;
    init() {
        self.rec = Defaults{};
    }
}