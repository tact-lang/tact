// multi-layered deep struct field chains

struct Layer3 {
    x: Int;
    y: Bool?;
}

struct Layer2 {
    inner: Layer3;
    flag: Bool;
}

struct Layer1 {
    payload: Layer2;
    label: String;
}

contract Test {
    data: Layer1;

    init() {
        self.data = Layer1{
            payload: Layer2{
                inner: Layer3{
                    x: 7,
                    y: null,
                },
                flag: true,
            },
            label: "abc",
        };
    }
}