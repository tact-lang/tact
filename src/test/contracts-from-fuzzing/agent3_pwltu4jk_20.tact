// Struct with large number of primitive fields
struct PrimitiveFlood {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
}

contract ManyPrimitives {
    p: PrimitiveFlood;

    init() {
        self.p = PrimitiveFlood{
            i1:1, i2:2, i3:3, i4:4, i5:5, i6:6, i7:7, i8:8, i9:9, i10:10,
            b1:true, b2:false, b3:true, b4:false, b5:true, b6:false, b7:true, b8:false, b9:true, b10:false
        };
    }
}