struct DeepNested {
    z: Int;
}

struct Middle {
    m: DeepNested;
}

struct Outer {
    o: Middle;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{o: Middle{m: DeepNested{z: 42}}};
    }
}