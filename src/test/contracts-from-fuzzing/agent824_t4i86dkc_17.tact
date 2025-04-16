// contract with many types of persistent fields
contract TestContract {
    x: Int;
    y: Int?;
    z: Bool;
    u: Bool?;
    a: String;
    b: String?;
    c: Address;
    d: Address?;

    init() {
        self.x = 1;
        self.y = null;
        self.z = true;
        self.u = null;
        self.a = "hi";
        self.b = null;
        self.c = myAddress();
        self.d = null;
    }
}