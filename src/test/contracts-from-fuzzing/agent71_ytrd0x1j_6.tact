struct TupleStruct { fst: Int; snd: Bool; }

contract TestTupleStructGetter {
    receive() {}

    // Getter returning a tuple represented as a struct
    get fun getTuple(): TupleStruct {
        return TupleStruct { fst: 123, snd: true };
    }
}
