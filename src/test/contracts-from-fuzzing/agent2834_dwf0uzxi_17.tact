struct Param {
    id: Int;
    label: String;
    extra: Int?;
    flag: Bool?;
}

contract MultiParams {
    first: Param;
    second: Param;

    init() {
        self.first = Param{ id:1, label:"f", extra:null, flag:null };
        self.second = Param{ id:2, label:"s", extra:null, flag:null };
    }
}