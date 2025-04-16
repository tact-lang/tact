struct Wrap { f:Int; }
struct Outer { s:String; inner:Wrap; }

contract C {
    o: Outer;
    bo: Bool?;

    init() {
        self.o = Outer{s:"str", inner:Wrap{f:1}};
        self.bo = null;
    }
}