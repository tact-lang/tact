// optional struct with default values internally
struct DStruct {
    a: Int = 1;
    b: Bool = true;
}

contract OptStructDefaultsInside {
    f: DStruct?;

    init() {
        self.f = null;
    }
}