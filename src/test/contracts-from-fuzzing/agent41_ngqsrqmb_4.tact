struct DeepNested3 { 
    val: Int;
    text: String;
}

struct DeepNested2 {
    sn: DeepNested3;
    flag: Bool;
}

struct DeepNested1 {
    s: DeepNested2;
    number: Int;
}

contract DeepTest {
    data: DeepNested1;
    init() {
        self.data = DeepNested1{
            s: DeepNested2{
                sn: DeepNested3{
                    val: 99,
                    text: "deep",
                },
                flag: true,
            },
            number: 123,
        };
    }
}