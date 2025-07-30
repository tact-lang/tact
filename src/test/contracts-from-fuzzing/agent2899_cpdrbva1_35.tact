struct InnerOptRec { val: Int?; }
struct MiddleRec { inner: InnerOptRec; }
struct OuterRec { middle: MiddleRec; }

contract OptRecFields {
    o: OuterRec;

    init() {
        self.o = OuterRec{ middle: MiddleRec{ inner: InnerOptRec{ val: null }}};
    }
}
