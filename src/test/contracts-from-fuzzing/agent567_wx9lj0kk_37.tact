// nested optionals + struct defaults
struct Inner {
    n: Int?;
    txt: String = "hi";
}

struct Outer {
    i: Inner?;
}

contract DefaultsMix {
    val: Outer?;
    init() {
        self.val = Outer{
            i: Inner{ n:null, txt:"bye" }
        };
    }
}
