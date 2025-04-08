struct S { a:Int; }

contract OptionalStructContract {
    sOpt: S?;

    init() {
        self.sOpt = null;
    }
}
