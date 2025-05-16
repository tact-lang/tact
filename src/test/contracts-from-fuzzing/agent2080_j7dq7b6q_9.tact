struct Inner2 {
    a: Int;
    b: String?;
}

struct Middle2 {
    nested: Inner2?;
    flag: Bool;
}

struct Outer2 {
    middle: Middle2?;
    text: String;
}

contract TestContract {
    data: Outer2;
    init() {
        self.data = Outer2{
            middle: Middle2{
                nested: Inner2{
                    a: 7,
                    b: null
                },
                flag: true
            },
            text: "deep optional"
        };
    }
}