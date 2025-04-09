struct DeepNested {
    x: Int;
    y: Bool;
    z: String;
}

struct Middle {
    val: Int;
    inn: DeepNested;
}

struct Outer {
    flag: Bool;
    mid: Middle;
    text: String;
}

contract TestContract {
    huge: Outer;

    init() {
        self.huge = Outer{
            flag: true,
            mid: Middle{
                val: 55,
                inn: DeepNested{
                    x:123,
                    y:false,
                    z: "hello"
                }
            },
            text: "outer"
        };
    }
}