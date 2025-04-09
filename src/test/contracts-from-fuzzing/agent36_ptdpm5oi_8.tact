struct Inner {
    value: Int?;
    label: String;
}

struct Outer {
    count: Int;
    info: Inner?;
}

contract OptNestedStruct {
    stuff: Outer;     // persistent, non-optional
    
    init() {
        self.stuff = Outer{
            count: 2,
            info: Inner{
                value: 99,
                label: "X"
            }
        };
    }

    receive() {
        let _ = self.stuff;
    }
}