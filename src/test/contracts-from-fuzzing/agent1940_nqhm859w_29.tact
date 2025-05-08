struct ManyNullable {
    n1: Int?;
    n2: Int?;
    n3: Int?;
    n4: Int?;
    n5: Int?;
}

contract FiveNullables {
    data: ManyNullable;

    init() {
        self.data = ManyNullable{
            n1:null, n2:null, n3:null, n4:null, n5:null
        };
    }
}