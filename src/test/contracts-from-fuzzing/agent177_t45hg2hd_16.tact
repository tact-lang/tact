contract OptionalFieldsContract {
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;
    optAddr: Address? = null;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optString = "zzz";
        self.optAddr = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
    receive(){}
}