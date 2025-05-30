struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner?;
    flag: Bool;
}

contract TestStorage {
    data: Outer = Outer{
        nested: null,
        flag: true
    };

    receive() {
        let z = self.data;
    }
}