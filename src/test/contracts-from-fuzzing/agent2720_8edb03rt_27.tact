struct Check {
    small: Int as uint4; // 0..15
}

contract Test {
    c: Check = Check{ small: 20 };
}