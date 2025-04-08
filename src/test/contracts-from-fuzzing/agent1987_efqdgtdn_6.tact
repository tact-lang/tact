struct SubStruct1 {
    f1: Int;
    f2: Bool;
}

struct SubStruct2 {
    f3: String;
    f4: Int?;
}

struct Combined {
    left: SubStruct1;
    right: SubStruct2;
}

contract CombinedFields {
    data: Combined;
    init() {
        self.data = Combined{
            left: SubStruct1{f1:1,f2:true},
            right: SubStruct2{f3:"hello",f4:null}
        };
    }
}