struct WeirdMix {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract WeirdMixContract {
    w: WeirdMix;
    init() {
        self.w = WeirdMix{
            a:1,b:"two",c:true,d:3,e:"four",f:false
        };
    }
}