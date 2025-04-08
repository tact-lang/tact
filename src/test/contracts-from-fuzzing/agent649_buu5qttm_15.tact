struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
    o5: Int?;
    o6: Bool?;
    o7: String?;
}

contract OptionalTest {
    many: ManyOptionals = ManyOptionals{
        o1:null,o2:null,o3:null,o4:null,
        o5:null,o6:null,o7:null
    };
    receive() {
        let _ = self.many.o7;
    }
}