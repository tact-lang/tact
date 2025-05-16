struct Middle {
    a: Int;
}
struct Outer {
    mid: Middle?;
}
contract OptionalMiddle {
    o: Outer;
    init() {
        self.o = Outer{mid: Middle{a:44}};
    }
}