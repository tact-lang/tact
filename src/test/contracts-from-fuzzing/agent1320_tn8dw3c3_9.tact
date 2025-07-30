struct LargeOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract LargeOptTest {
    data: LargeOpt = LargeOpt{
        a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
    };

    receive() {
        self.data = LargeOpt{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        };
    }
}