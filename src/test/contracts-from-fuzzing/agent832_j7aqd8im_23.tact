struct UnusualOrder {
    z: Bool;
    y: String;
    x: Int;
}

contract WeirdOrder {
    field: UnusualOrder = UnusualOrder{z:true,y:"yes",x:7};
    receive() {
        let _ = self.field.x;
    }
}