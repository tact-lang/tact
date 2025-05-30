// Struct with nested optional struct inside optional struct

struct Leaf { val: Int; }

struct Middle { leaf: Leaf?; extra: Int; }

struct Root { mid: Middle?; flag: Bool; }

contract DeepNullable {
    root: Root = Root{ mid: null, flag: false };

    init() {
        self.root = Root{
            mid: Middle{ leaf: Leaf{ val: 99 }, extra: 100 },
            flag: true
        };
    }

    receive() {}
}