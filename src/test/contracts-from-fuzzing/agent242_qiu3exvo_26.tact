struct WeirdInts {
    a: Int as uint7;
    b: Int as int3;
}

contract WeirdStruct {
    weird: WeirdInts = WeirdInts{ a: 127, b: 3 };
}