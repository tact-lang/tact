struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Middle { i1: Inner1; i2: Inner2; }
struct Outer { mid: Middle; someStr:String; }

contract CompositeDeep {
    s: Outer;
    init() {
        self.s = Outer{
            mid: Middle{
                i1: Inner1{x: 5},
                i2: Inner2{y: true}
            },
            someStr: "ok"
        };
    }
    receive() {}
}