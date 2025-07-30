contract OptDefaultThenNull {
    optInt: Int? = 7;

    init() {
        self.optInt = null;
    }
}