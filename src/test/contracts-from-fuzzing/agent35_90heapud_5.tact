struct StructWithManyBools {
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
    b11: Bool;
    b12: Bool;
    b13: Bool;
    b14: Bool;
    b15: Bool;
    b16: Bool;
}

contract ManyBoolsTest {
    flags: StructWithManyBools = StructWithManyBools{
        b1:false, b2:false, b3:false, b4:false, b5:false, b6:false, b7:false, b8:false,
        b9:false, b10:false, b11:false, b12:false, b13:false, b14:false, b15:false, b16:false
    };
}