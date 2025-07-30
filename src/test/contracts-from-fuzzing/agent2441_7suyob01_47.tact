message(11) M1 { a: Int }
message(22) M2 {}
message(33) M3 { b: Bool }
message(44) M4 {}

contract LotsOfOptionalMessages {
    m1: M1? = null;
    m2: M2? = null;
    m3: M3? = null;
    m4: M4? = null;

    init() {}
}