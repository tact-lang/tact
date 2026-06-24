struct MessOpt {
    m: Mess?;
}

message SomeMsg {
    a: Int;
}

struct Mess {
    a: SomeMsg;
}

contract NestedMessageOptional {
    field: MessOpt = MessOpt{ m: null };
    init() {}
}