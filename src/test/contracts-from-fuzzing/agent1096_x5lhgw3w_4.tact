struct NS {
    n1: Int?;
    n2: Int?;
    n3: Int?;
    n4: Int?;
    n5: Int?;
    n6: Int?;
    n7: Int?;
    n8: Int?;
    n9: Int?;
    n10: Int?;
}

contract ManyOptionals {
    optStruct: NS;
    init() {
        self.optStruct = NS{
            n1:null,n2:null,n3:null,n4:null,n5:null,
            n6:null,n7:null,n8:null,n9:null,n10:null
        };
    }
}