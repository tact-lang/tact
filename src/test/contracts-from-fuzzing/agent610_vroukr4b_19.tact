struct IntHolder {
    a: Int;
}

struct OptionalHolder {
    ih: IntHolder?;
    str: String?;
    flag: Bool?;
}

contract OptDeep {
    oh: OptionalHolder;

    init() {
        self.oh = OptionalHolder{
            ih: null,
            str: null,
            flag: null
        };
    }
}