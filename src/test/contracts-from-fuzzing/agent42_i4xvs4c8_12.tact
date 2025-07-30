struct HasManyBooleans {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
}

contract LotsOfBooleans {
    bools: HasManyBooleans;

    init() {
        self.bools = HasManyBooleans{
            a:true,b:false,c:true,d:true,e:false,f:true,g:true
        };
    }
}