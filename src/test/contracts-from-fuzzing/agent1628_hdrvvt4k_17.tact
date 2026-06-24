// Large nested struct with many optional fields
struct Inner1 { x: Int?; y: Bool?; }
struct Inner2 { a: Int?; b: Inner1?; }
struct Large {
    k1: Inner1?;
    k2: Inner2?;
    flag: Bool;
    num: Int;
    text: String;
}

contract TestContract {
    dat: Large;

    init() {
        self.dat = Large{
            k1: Inner1{x:7, y:null},
            k2: Inner2{a:null, b:Inner1{x:null, y:true}},
            flag:true,
            num:12345,
            text:"hi"
        };
    }
}