struct RefStruct {
    id: Int;
    label: String;
    flag: Bool;
}

contract MultipleRefStructs {
    s1: RefStruct;
    s2: RefStruct;
    s3: RefStruct;

    init() {
        self.s1 = RefStruct{id:1,label:"one",flag:true};
        self.s2 = RefStruct{id:2,label:"two",flag:false};
        self.s3 = RefStruct{id:3,label:"three",flag:true};
    }
}