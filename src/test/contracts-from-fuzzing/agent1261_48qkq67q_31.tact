struct Named {
    aa: Int;
    bb: Bool;
    cc: String;
    dd: Int?;
    ee: Bool?;
    ff: String?;
}

contract DoubleFields {
    x: Named;
    y: Named;

    init() {
        self.x = Named{
            aa:1,bb:true,cc:"x",dd:null,ee:null,ff:null
        };
        self.y = Named{
            aa:2,bb:false,cc:"y",dd:5,ee:true,ff:"hi"
        };
    }
}