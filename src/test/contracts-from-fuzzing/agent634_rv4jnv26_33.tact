// test optional serialization with default null in struct
struct SerDefOpt {
    foo: Int? as uint8 = null;
    bar: Bool? = null;
}

contract PersistSerDefOpt {
    val: SerDefOpt;
    
    init() {
        self.val = SerDefOpt{}; // rely defaults
    }
}