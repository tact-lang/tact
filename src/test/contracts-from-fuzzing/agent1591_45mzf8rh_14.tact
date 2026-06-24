// chain of optional structs, nested
struct InnerOpt {
    val: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract ChainOptStruct {
    st: OuterOpt?;

    init() {
        self.st = null;
    }
}