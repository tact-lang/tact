// Edge test: set large optionals explicitly to null
contract NullifyMany {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;

    init() {
        self.o1=null; self.o2=null; self.o3=null; self.o4=null;
        self.o5=null; self.o6=null;
    }
}