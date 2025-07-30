struct Mess {
    a: Int;
}

message M1 {
    m: Mess;
}

contract Cont {
    f: M1 = M1{
        m: Mess{
            a: 42
        }
    };
    init() {}
}