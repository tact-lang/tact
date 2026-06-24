struct Combo {
 x: Int;
 y: Bool?;
 z: String?;
}

contract NullablesInStruct {
    data: Combo;

    init() {
        self.data=Combo{ x:9,y:null,z:null };
    }
}
