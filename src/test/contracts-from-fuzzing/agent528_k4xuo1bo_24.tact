struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Slice?;
    o5: Cell?;
    o6: Address?;
}

contract TestContract {
    o: ManyOptionals;
    init() {
        self.o = ManyOptionals{o1:null,o2:null,o3:null,o4:null,o5:null,o6:null};
    }
}