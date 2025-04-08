struct InnerLevel2 {
    flag: Bool = true;
}

struct InnerLevel1 {
    num: Int = 7;
    inner2: InnerLevel2;
}

struct RootStruct {
    text: String = "hello";
    inner1: InnerLevel1;
}

contract TestContract {
    state: RootStruct;

    init() {
        self.state = RootStruct{
            text: "hi",
            inner1: InnerLevel1{
                num: 21,
                inner2: InnerLevel2{ flag: false }
            }
        };
    }

    receive() {
        self.state = self.state; // trivial, forces use
    }
}