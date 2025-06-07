struct OptNest {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract Options {
    o1: OptNest?;
    o2: OptNest;
    o3: Int?;
    o4: String?;

    init() {
        self.o1 = null;
        self.o2 = OptNest{ i:1, b:true, s:"h"};
        self.o3 = null;
        self.o4 = null;
    }
}