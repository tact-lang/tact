struct Fixed {
    a: Int as int16; 
    b: Int as uint4;
}

contract FixedSerialize {
    f: Fixed = Fixed{ a: 0, b: 2 };
}