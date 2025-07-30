struct Inner {
    x: Int;
    y: Int;
    flag: Bool?;
    text: String;
}

struct Outer {
    innerField: Inner;
    flag2: Bool;
    optInt: Int?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            innerField: Inner{
                x: 10,
                y: 20,
                flag: true,
                text: "abc"
            },
            flag2: false,
            optInt: null
        };
    }
}