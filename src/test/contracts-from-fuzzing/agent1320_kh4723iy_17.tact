message(3) MM {
    mval: Int = 0;
}

struct SS {
    sval: String = "hello";
    m: MM;
}

message(4) MM2 {
    inner: SS;
}

contract MsgStructMix {
    data: MM2 = MM2{ inner: SS{ m: MM{} } };
}