// Large combination optional + normal values on nested structs
struct Info {
    id: Int;
    flag: Bool;
    data: Int?;
    cond: Bool?;
}

contract InfoContract {
    info: Info;

    init() {
        self.info = Info{
            id: 808,
            flag: true,
            data: null,
            cond: null
        };
    }
}