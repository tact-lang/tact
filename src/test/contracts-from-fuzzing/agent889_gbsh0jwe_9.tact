struct InnerOne {
    a: Int;
}
struct InnerTwo {
    b: Bool;
}
struct Middle {
    in1: InnerOne;
    in2: InnerTwo;
}
contract NestMultipleStructs {
    mid: Middle;

    init() {
        self.mid = Middle{in1: InnerOne{a:1}, in2: InnerTwo{b:true}};
    }
}