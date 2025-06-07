message(1) MsgA { x: Int }

struct Inner {
    m: MsgA?;
    y: Bool;
}

struct Outer {
    innerOpt: Inner?;
    z: String;
}

contract TestContract {
    data: Outer = Outer{ innerOpt: null, z: "" };

    init() {
        self.data = Outer{
            innerOpt: Inner{
                m: MsgA{ x: 7 },
                y: true
            },
            z: "deep"
        };
    }
}