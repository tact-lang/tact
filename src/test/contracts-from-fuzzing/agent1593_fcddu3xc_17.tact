// Struct with many optional fields initializing to null
struct MultiOpt {
    p: Int?;
    q: String?;
    r: Bool?;
    s: Int?;
    t: String?;
}

contract TestStruct {
    complex: MultiOpt;

    init() {
        self.complex = MultiOpt{
            p: null, q: null, r: null, s: null, t: null
        };
    }
}