struct ManyLevels0 {
    a: Int;
}
struct ManyLevels1 {
    s: ManyLevels0;
}
struct ManyLevels2 {
    s: ManyLevels1;
}
struct ManyLevels3 {
    s: ManyLevels2;
}
struct ManyLevels4 {
    s: ManyLevels3;
}
struct ManyLevels5 {
    s: ManyLevels4;
}

contract TestContract {
    data: ManyLevels5;

    init() {
        self.data = ManyLevels5{ s: ManyLevels4{ s: ManyLevels3{ s: ManyLevels2{ s: ManyLevels1{ s: ManyLevels0{ a: 99 } } } } } };
    }
}
