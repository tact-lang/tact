struct S {
    a: Int;
    b: Int;
}

contract MultiAssignStruct {
    data: S;
    
    init() {
        let s = S{ a: 1, b: 2 };
        self.data = s;
    }
}