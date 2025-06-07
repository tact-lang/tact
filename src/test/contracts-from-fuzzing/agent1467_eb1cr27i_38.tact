struct IntAndBool {
    i:Int;
    b:Bool;
}

contract IntBoolStorage {
    data:IntAndBool;
    init() {
        self.data=IntAndBool{
            i:42,
            b:true
        };
    }
}