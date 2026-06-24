struct HasBool {
    flag: Bool;
}

struct HasStruct {
    nested: HasBool;
}

contract BoolNested {
    rec: HasStruct;

    init() {
        self.rec = HasStruct{nested: HasBool{flag:true}};
    }
}
