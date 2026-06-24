struct ManyOptions {
    i1: Int?; i2: Int?; i3: Int?; i4: Int?; i5: Int?;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?;
    s1: String?; s2: String?; s3: String?; s4: String?; s5: String?;
}

contract ManyOptTest {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions{
            i1:null,i2:null,i3:null,i4:null,i5:null,
            b1:null,b2:null,b3:null,b4:null,b5:null,
            s1:null,s2:null,s3:null,s4:null,s5:null
        };
    }
}