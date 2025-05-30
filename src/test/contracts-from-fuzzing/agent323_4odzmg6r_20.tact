struct Meta {
    title: String;
    code: Int;
}

message(100) Envelope {
    meta: Meta;
    urgent: Bool;
}

contract Test(
    msg: Envelope,
) {}