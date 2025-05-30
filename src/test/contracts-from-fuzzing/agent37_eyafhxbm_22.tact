struct Payload {
    n: Int;
    s: String;
    flag: Bool;
}

struct Meta {
    creator: String;
    timestamp: Int;
}

struct Complex {
    data: Payload;
    meta: Meta;
    optInfo: String?;
}

contract TestContract {
    c: Complex = Complex{
        data: Payload{n:1,s:"one",flag:true},
        meta: Meta{creator:"A",timestamp:1000},
        optInfo:null
    };

    init() {
        self.c = Complex{
            data: Payload{n:2,s:"two",flag:false},
            meta: Meta{creator:"B",timestamp:2000},
            optInfo: "details"
        };
    }
    receive(){}
}