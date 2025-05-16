struct Info {
    flag: Bool?;
    owner: Address?;
    note: String?;
    data: Cell?;
}

contract Test {
    info: Info = Info {
        flag: null,
        owner: null,
        note: null,
        data: null
    };
}