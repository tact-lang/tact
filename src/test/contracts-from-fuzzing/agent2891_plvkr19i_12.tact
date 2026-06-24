struct Nested {
    n1: Int;
    n2: String;
    n3: Bool;
    n4: Int?;
    n5: String?;
    n6: Bool?;
}

contract LargeNested {
    obj: Nested;
    init() {
        self.obj = Nested{
            n1:1, n2:"x", n3:true, n4:null, n5:null, n6:null
        };
    }
}