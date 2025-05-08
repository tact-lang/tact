struct Info {
    name: String;
    nickname: String?;
}

contract Test {
    info: Info = Info{name: "Alice", nickname: null};
}