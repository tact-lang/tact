struct DeepCombined {
    s: Inner1;
    t: Inner2;
}

struct Inner1 {
    x: Int;
    y: Inner3?;
}

struct Inner2 {
    a: Bool;
    b: Inner3?;
}

struct Inner3 {
    val: String;
}

contract DeepComboContract {
    dc: DeepCombined;

    init() {
        self.dc = DeepCombined{
            s: Inner1{x:1, y:null},
            t: Inner2{a:true, b:Inner3{val:"x"}}
        };
    }
}