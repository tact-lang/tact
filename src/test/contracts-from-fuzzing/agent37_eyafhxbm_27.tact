struct Data {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    data: Data = Data{
        a:1, b:null, c:true, d:null, e:"abc", f:null
    };

    init() {
        self.data = Data{
            a:2, b:20, c:false, d:true, e:"xyz", f:"done"
        };
    }
    receive() {}
}