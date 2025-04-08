// Edge case: optional of a struct with multiple nested optionals.
struct InnerMultiOpt {
    m: Int?;
    n: Bool?;
    o: Address?;
}

contract OptionalOfOptStruct {
    s: InnerMultiOpt? = null;

    init() {
        self.s = InnerMultiOpt{
            m: 100,
            n: true,
            o: myAddress(),
        };
    }

    receive() {
        self.s = self.s;
    }
}