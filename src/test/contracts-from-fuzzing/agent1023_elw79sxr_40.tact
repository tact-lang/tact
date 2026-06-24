struct Holder {
    i:Int;
    s:String;
}

contract OptionalStructInner {
    h: Holder?;
    init() {
        self.h = null;
    }
}