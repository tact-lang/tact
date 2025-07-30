// deeply nested optional chain using contract fields only (no structs)
contract TestContract {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
    }

    receive() {
        let _ = self.o1;
        let _ = self.o2;
        let _ = self.o3;
        let _ = self.o4;
        let _ = self.o5;
    }
}