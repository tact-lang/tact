contract TestContract {
    x: Int as int64;
    y: Bool;
    z: String;
    a: Address;

    init() {
        self.x = 0;
        self.y = false;
        self.z = "";
        self.a = myAddress();
    }
}