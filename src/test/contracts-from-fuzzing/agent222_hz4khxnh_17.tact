struct SOptInt {
    x: Int?;
}

struct SOptBool {
    y: Bool?;
}

struct Container {
    sInt: SOptInt?;
    sBool: SOptBool?;
}

contract NestedStructNulls {
    val: Container = Container{sInt: null, sBool: null};

    receive() {
        self.val = Container{
            sInt: SOptInt{x: 52},
            sBool: null
        };
    }
}