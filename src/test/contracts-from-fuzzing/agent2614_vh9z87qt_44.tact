contract InitOnlyPartial {
    a:Int;
    b:Int=20;

    init() {
        self.a=99;
    }
}