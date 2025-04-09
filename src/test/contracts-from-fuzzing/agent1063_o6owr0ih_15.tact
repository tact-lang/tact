struct OptStruct { f1: Int?; f2: Bool?; f3: String?; }

contract OptStructHolder {
    f: OptStruct;

    init() {
        self.f = OptStruct{ f1: null, f2: null, f3: null };
    }
}