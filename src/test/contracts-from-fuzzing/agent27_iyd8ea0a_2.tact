struct S1 {
    a: Int;
    b: Bool?;
    c: String;
}

struct S2 {
    x: Int?;
    y: S1;
    z: Bool;
}

contract StorageTest {
    state: S2;

    init() {
        self.state = S2{
            x: null,
            y: S1{
                a: 10,
                b: true,
                c: "abc"
            },
            z: false
        };
    }
}