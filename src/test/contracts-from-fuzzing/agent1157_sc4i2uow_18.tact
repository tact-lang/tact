struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    x: Int;
    y: Inner1;
}

struct RootStruct {
    x: String;
    y: Bool?;
    z: Inner2;
}

contract MixedNested {
    data: RootStruct;

    init() {
        self.data = RootStruct{
            x: "hello",
            y: null,
            z: Inner2{ x: 2, y: Inner1{ x: 3, y: true } }
        };
    }
}