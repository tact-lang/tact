// optional int with default int expression
struct OptIntExpr {
    x: Int? = 5 + 7;
}

contract TestContract {
    o: OptIntExpr;
    init() {
        self.o = OptIntExpr{};
    }
}