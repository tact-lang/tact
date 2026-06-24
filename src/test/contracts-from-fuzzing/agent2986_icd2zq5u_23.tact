// optional tuple as single field
struct TupleStruct {
    a: Int;
    b: Bool;
}

contract OptTupleStruct {
    t: TupleStruct?;

    init() {
        self.t = null;
    }
}