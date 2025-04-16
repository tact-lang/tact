struct ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract ManyBoolStruct {
    m: ManyBools = ManyBools{ b1: true, b2: false, b3: true, b4: false };
}