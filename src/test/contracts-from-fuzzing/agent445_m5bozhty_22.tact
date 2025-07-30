struct BoolStruct {
    b: Bool;
}

contract BoolStore {
    f: BoolStruct;
    init() {
        self.f = BoolStruct{b:true};
    }
}