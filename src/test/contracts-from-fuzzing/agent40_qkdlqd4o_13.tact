struct DeeplyNested {
    s: String;
    inner1: Inner1;
}

struct Inner1 {
    flag: Bool;
    inner2: Inner2;
}

struct Inner2 {
    amount: Int;
    inner3: Inner3;
}

struct Inner3 {
    text: String?;
    anotherInt: Int;
}

contract StorageVeryDeep {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s: "top",
            inner1: Inner1{
                flag:true,
                inner2: Inner2{
                    amount: 123,
                    inner3: Inner3{
                        text: null,
                        anotherInt: 456
                    }
                }
            }
        };
    }
}