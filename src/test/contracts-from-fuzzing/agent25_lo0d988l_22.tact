// Persistent storage with mixture of optionals + serialization annotations
contract TestContract {
    a: Int?;
    b: Bool?;
    c: String?;
    x: Int as uint64;
    y: Int as int32;
    z: Int as coins;

    init() {
        self.a = null;
        self.b = false;
        self.c = "hello";
        self.x = 100;
        self.y = -50;
        self.z = ton("0.01");
    }
}