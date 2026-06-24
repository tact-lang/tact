struct BitsAndOpts {
    a: Int as uint3 = 3;
    b: Int? as int5;
    c: Int as uint7 = 7;
}

contract OptStructWithWidths {
    stuff: BitsAndOpts?;
}