struct DeepNested {
    flag: Bool;
    message: String?;
}

struct Middle {
    count: Int;
    deep: DeepNested;
}

struct Outer {
    number: Int;
    middle: Middle;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            number: 7,
            middle: Middle{
                count: 5,
                deep: DeepNested{
                    flag: false,
                    message: null,
                },
            },
        };
    }
}