struct InnerFine {
    a: Int as uint32;
    b: Bool;
}

struct OuterEdge {
    c: InnerFine?;
    d: Int as int64;
    e: Bool?; 
}

contract SerializeMix {
    state: OuterEdge;

    init() {
        self.state = OuterEdge{
            c: null,
            d: -1234567,
            e: true
        };
    }
}