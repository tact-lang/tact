struct OptionalRec {
    inner: InnerRec?;
}

struct InnerRec {
    name: String;
    flag: Bool;
}

contract OptRecursion {
    data: OptionalRec;

    init() {
        self.data = OptionalRec{
            inner: InnerRec{
                name: "opt",
                flag: true
            }
        };
    }
}