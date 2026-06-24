// struct with tons of optional fields
struct ManyMaybe {
    a:Int?;b:Int?;c:Int?;d:Int?;e:Int?;
    f:Int?;g:Int?;h:Int?;i:Int?;j:Int?;
}

contract BigOpt {
    state: ManyMaybe;

    init() {
        self.state = ManyMaybe{
            a:null,b:1,c:2,d:null,e:5,
            f:6,g:null,h:8,i:null,j:10
        };
    }
}