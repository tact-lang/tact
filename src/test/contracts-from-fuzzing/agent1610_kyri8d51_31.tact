struct WideOne {
    a:Int;
    b:Bool;
    c:String;
    d:Int;
    e:Bool;
    f:String;
    g:Int;
    h:Bool;
    i:String;
    j:Int;
    k:Bool;
    l:String;
}
contract WidePersistent {
    data: WideOne;
    init() {
        self.data = WideOne{
            a:1,b:true,c:"x",d:2,e:false,f:"y",g:3,h:true,i:"z",j:4,k:false,l:"w"
        };
    }
}