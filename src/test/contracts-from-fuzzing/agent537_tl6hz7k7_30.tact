contract TestContract {
    emptyStr: String = "";
    trueBool: Bool = true;
    falseBool: Bool = false;

    receive() {
        self.emptyStr = self.emptyStr;
        self.trueBool = self.trueBool;
        self.falseBool = self.falseBool;
    }
}
