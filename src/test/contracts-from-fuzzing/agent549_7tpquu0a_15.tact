contract FieldAssignmentOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.d = myAddress();
        self.c = "XYZ";
        self.b = false;
        self.a = 99;
    }
}