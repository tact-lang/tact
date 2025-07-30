struct MidStruct {
    one: Int;
    two: Bool;
    sub: SubStruct;
}

struct SubStruct {
    flag: Bool;
    val: Int?;
}

contract TestContract {
    ms: MidStruct;

    init() {
        self.ms = MidStruct{
            one: 12,
            two: false,
            sub: SubStruct{
                flag:true,
                val:null
            }
        };
    }
}