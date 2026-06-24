struct LargeOptionals {
    a:Int?;b:Int?;c:Int?;d:Int?;e:Int?;f:Int?;g:Int?;h:Int?;i:Int?;j:Int?;
}

contract Test20 {
    lo: LargeOptionals;

    init() {
        self.lo = LargeOptionals{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null
        };
    }
}