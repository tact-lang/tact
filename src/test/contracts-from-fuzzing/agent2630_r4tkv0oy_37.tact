struct PlainA { x: Int }
struct PlainB { x: Int }
struct PlainC { x: Int }

contract SeqComposed {
    a: PlainA;
    b: PlainB;
    c: PlainC;

    init() {
        self.a = PlainA{x:1};
        self.b = PlainB{x:2};
        self.c = PlainC{x:3};
    }
}