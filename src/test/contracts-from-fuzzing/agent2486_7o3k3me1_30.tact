struct Inner { a:Int; b:Bool }
struct Wrapper { x:Inner; flag:Bool }

contract OverrideInit {
    myVal:Wrapper;

    init() {
        self.myVal = Wrapper{ x:Inner{a:123,b:true}, flag:false };
    }
}