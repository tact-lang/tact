struct PackedOption {
    a:Int?; b:Int?; c:Int?;
    d:Int?; e:Int?; f:Int?;
}

contract PackOptTest {
    o: PackedOption;

    init() {
        self.o = PackedOption{
            a:null, b:1, c:null, d:2, e:3, f:null
        };
    }
}