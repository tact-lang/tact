// Struct with many optional fields only
struct Optionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
}

contract TestContract {
    opts: Optionals;

    init() {
        self.opts = Optionals{
            o1:null,
            o2:null,
            o3:null,
            o4:null,
            o5:null,
            o6:null,
        };
    }
}
