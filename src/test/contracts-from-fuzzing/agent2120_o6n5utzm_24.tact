contract DefaultsAndNulls {
    optInt: Int?;
    boolVal: Bool = false;
    strVal: String = "";

    init() {
        self.optInt = null;
    }
}