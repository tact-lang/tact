struct NullableMany {
    i1: Int?;
    i2: Int?;
    s1: String?;
    s2: String?;
    b1: Bool?;
    b2: Bool?;
}

contract ManyOptionals {
    data: NullableMany;

    init() {
        self.data = NullableMany{
            i1:null,i2:null,s1:null,s2:null,b1:null,b2:null,
        };
    }

    receive() {
        let d = self.data;
    }
}