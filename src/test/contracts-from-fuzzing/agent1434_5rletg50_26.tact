struct Outer {
    in1: Inner1;
    in2: Inner2;
}
struct Inner1 {
    val1: Int;
    val2: Bool;
}
struct Inner2 {
    val3: Int;
    val4: String;
}
contract TwoNestedStructs {
    out: Outer;
    init() {
        self.out = Outer{
            in1: Inner1{ val1:1, val2:true },
            in2: Inner2{ val3:2, val4:"z" }
        };
    }
}