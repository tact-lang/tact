// Test combination of many nested structs, optional fields, and various types

struct InnerMost {
    x: Int;
    y: String?;
}

struct Middle {
    a: InnerMost;
    b: InnerMost?;
    flag: Bool;
    note: String?;
}

struct OuterMost {
    cat: Middle;
    dog: Middle?;
    message: String;
}

contract TestContract {
    zoo: OuterMost;
    init() {
        self.zoo = OuterMost{
            cat: Middle{
                a: InnerMost{ x:1, y:null },
                b: null,
                flag: true,
                note: null
            },
            dog: null,
            message: "hi"
        };
    }
}