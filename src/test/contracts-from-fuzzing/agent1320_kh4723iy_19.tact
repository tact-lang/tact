struct Info {
    title: String?;
    value: Int?;
}

message(123456) MsgOpt {
    index: Int?;
    info: Info?;
}

contract OptionalMessageNested {
    m: MsgOpt?;
}