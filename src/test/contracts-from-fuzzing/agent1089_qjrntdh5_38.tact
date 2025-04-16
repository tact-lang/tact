message(100) M3 {}
message(101) M2 { m3: M3; }
message(102) M1 { m2: M2; }

contract DeepMsgWrap {
    m: M1 = M1{ m2: M2{ m3: M3{} } };
}