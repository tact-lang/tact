contract TestContract {
    myOptInt: Int?;
    myOptBool: Bool?;
    myOptStr: String?;

    init() {
        self.myOptInt = 42;
        self.myOptBool = null;
        self.myOptStr = "hello";
    }
}