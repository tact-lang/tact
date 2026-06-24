struct A {
    x: Int;
    y: Bool;
    z: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
    nest: B;
}

struct B {
    u: Int;
    v: Bool;
    w: String;
    o4: Int?;
    o5: Bool?;
    o6: String?;
}

contract Test {
    mega: A;

    init() {
        self.mega = A{
            x: 1,
            y: false,
            z: "z",
            o1: null,
            o2: null,
            o3: null,
            nest: B{
                u: 2,
                v: true,
                w: "w",
                o4: null,
                o5: null,
                o6: null
            }
        };
    }
}