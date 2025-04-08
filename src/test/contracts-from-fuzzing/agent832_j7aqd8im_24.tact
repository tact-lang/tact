struct BoolStringInt {
    b: Bool;
    s: String;
    i: Int;
}

contract FieldSerialize {
    x: BoolStringInt = BoolStringInt{b:true,s:"ok",i:3};
    receive() {
        let _ = self.x.s;
    }
}