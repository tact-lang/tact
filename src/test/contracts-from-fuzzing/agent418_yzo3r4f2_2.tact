struct InnerLevel3 {
    v: Int;
}

struct InnerLevel2 {
    b: Bool;
    inner3: InnerLevel3;
}

struct InnerLevel1 {
    s: String;
    inner2: InnerLevel2;
}

contract DeepNest {
    val: InnerLevel1 = InnerLevel1{
        s: "deep",
        inner2: InnerLevel2{
            b: true,
            inner3: InnerLevel3{ v: 999 }
        }
    };

    receive() {
        self.val = InnerLevel1{
            s: "update",
            inner2: InnerLevel2{
                b: false,
                inner3: InnerLevel3{ v: 123 }
            }
        };
    }
}