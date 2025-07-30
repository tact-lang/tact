struct LongOptions {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract OptLong {
    data: LongOptions;

    init() {
        self.data = LongOptions{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}