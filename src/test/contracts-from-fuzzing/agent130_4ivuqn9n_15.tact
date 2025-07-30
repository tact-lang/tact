struct ManyOptional {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Int?;
}

contract ManyNulls {
    state: ManyOptional = ManyOptional{
        o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null
    };
    receive() {
        self.state = self.state;
    }
}