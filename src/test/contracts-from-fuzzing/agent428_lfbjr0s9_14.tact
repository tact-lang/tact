// contract with many optionals as persistent vars directly
contract TestContract {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;

    init() {
        self.o1 = null;
        self.o2 = 2;
        self.o3 = null;
        self.o4 = true;
        self.o5 = null;
        self.o6 = "yes";
    }
}