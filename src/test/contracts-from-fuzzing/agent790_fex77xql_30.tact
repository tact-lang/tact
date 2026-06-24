struct ManyNullable {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
}

contract LotsOfOptionals {
    o: ManyNullable;

    init() {
        self.o = ManyNullable{x1:null,x2:null,x3:null,x4:null,x5:null,x6:null,x7:null};
    }
}