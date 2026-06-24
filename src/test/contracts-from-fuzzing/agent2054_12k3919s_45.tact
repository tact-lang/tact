message MsgWithOpt {
    x: Int?;
    y: Bool?;
}

contract MsgNestedOpt {
    data: MsgWithOpt = MsgWithOpt{ x: null, y: null };
}