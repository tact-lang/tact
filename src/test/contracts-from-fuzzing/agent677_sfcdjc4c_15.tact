contract ImplicitNulls {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;

    receive() {
        let _ = self.optStr;
    }
}