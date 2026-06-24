// long nested with nulls
struct L3 { x:Int?; y:Bool?; }
struct L2 { inner:L3?; z:String; }
struct L1 { data:L2; f:Bool; }

contract Test {
    val: L1;

    init() {
        self.val = L1{
            data: L2{
                inner:null,
                z:"abc"
            },
            f:true
        };
    }
}