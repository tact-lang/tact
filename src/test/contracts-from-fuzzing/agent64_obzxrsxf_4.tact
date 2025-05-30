contract MapOfStructs {
    m: map<Int, MyStruct>;

    init() {
        self.m = emptyMap();
    }
}

struct MyStruct {
    x: Int;
    y: Bool;
    z: Int?;
}