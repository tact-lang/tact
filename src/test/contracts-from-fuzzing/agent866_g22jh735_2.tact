struct Deep {
    val: Int?;
}

struct Middle {
    deep: Deep?;
}

struct Outer {
    middle: Middle?;
}

contract PersistentNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null,
        };
    }
}

contract U {
    receive() {
        // call nothing, valid contract
    }
}