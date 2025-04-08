struct Deep {
    x: Int;
    y: Bool;
    z: String;
}

struct Wrapper {
    nested: Deep;
    flag: Bool;
    count: Int;
}

contract WrapperUse {
    data: Wrapper = Wrapper{
        nested: Deep{ x: 1, y: false, z: "test" },
        flag: true,
        count: 42
    };

    receive() {
        self.data = Wrapper{
            nested: Deep{ x: 2, y: true, z: "changed" },
            flag: false,
            count: 69
        };
    }
}