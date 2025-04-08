struct Info { text: String?; num: Int; }

message(12345) MsgWithNested {
    field: Info;
}