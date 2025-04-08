contract TestContract {
    myStr: String = "foo";
    myNum: Int = 1;
    myOpt: Int?;

    init() {
        self.myOpt = null;
    }
}