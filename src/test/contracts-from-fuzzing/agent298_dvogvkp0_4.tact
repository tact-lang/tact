struct Complex {
    x: Int;
    y: Bool;
    s: String;
    z: Slice;
    c: Cell;
    a: Address;
}

contract MixedTypes {
    data: Complex;
    init() {
        self.data = Complex{
            x:1,y:true,s:"hi",z:emptyCell().asSlice(),c:emptyCell(),a:myAddress()
        };
    }
}