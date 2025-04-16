struct Level3 {
    flag: Bool = false;
    data: String = "x";
}

struct Level2 {
    nested: Level3;
    optInt: Int?;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    st: Level1;

    init() {
        self.st = Level1{
            nested: Level2{
                nested: Level3{
                    flag: true,
                    data: "zzz"
                },
                optInt: 100
            }
        };
    }

    receive() {
        self.st.nested.nested.flag = false;
    }
}