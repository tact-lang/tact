struct OptTwice {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainOptStruct {
    inner: OptTwice;
    txt: String;
    flag: Bool;
}

contract MixedNested {
    val: ContainOptStruct;

    init() {
        self.val = ContainOptStruct{
            inner: OptTwice{a:null, b:null, c:null},
            txt: "X",
            flag: true
        };
    }
}
