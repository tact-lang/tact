struct Reordered {
    str: String;
    n: Int;
    flag: Bool;
    optStr: String?;
    optInt: Int?;
    optBool: Bool?;
}

contract ReorderedStructTest {
    data: Reordered;

    init() {
        self.data = Reordered{
            str:"a", n:1, flag:true,
            optStr:null, optInt:null, optBool:null
        };
    }

    receive() {
        let _=self.data;
    }
}