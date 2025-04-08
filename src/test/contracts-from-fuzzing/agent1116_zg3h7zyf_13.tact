struct Inner1 {
    x: Int;
    y: String;
}

struct Inner2 {
    flag: Bool;
    note: String?;
}

struct Outer {
    z: Int;
    optVal: Int?;
    in1: Inner1;
    in2: Inner2?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            z: 999,
            optVal: null,
            in1: Inner1{
                x: -5,
                y: "Y val"
            },
            in2: Inner2{
                flag: true,
                note: "Optional note"
            }
        };
    }
}