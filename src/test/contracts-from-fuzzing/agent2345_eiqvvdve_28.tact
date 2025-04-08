struct SubData {
    x: Int;
    y: Int;
    z: Int;
}

struct MainData {
    a: SubData;
    b: SubData;
    c: String;
}

contract NestedCompose {
    data: MainData;
    init() {
        self.data = MainData {
            a: SubData{ x:1, y:2, z:3 },
            b: SubData{ x:4, y:5, z:6 },
            c: "hi"
        };
    }
}
