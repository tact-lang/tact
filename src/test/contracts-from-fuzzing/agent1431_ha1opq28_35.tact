struct DefaultsInner {
    val: Int = 42;
    flag: Bool = true;
}

struct OuterOpt {
    inner: DefaultsInner?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            inner: DefaultsInner{} // should pick defaults inside inner automatically
        };
    }
}