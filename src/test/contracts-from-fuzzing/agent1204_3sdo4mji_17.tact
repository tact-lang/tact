struct InnerMost {
    val1: Int;
    val2: Int?;
}

struct Inner {
    nest: InnerMost;
    val3: Bool;
}

struct Outer {
    nest2: Inner;
    val4: String;
}

contract NestStructs {
    data: Outer;

    init() {
        self.data = Outer{
            nest2: Inner{
                nest: InnerMost{ val1:1, val2:null },
                val3:true
            },
            val4:"text"
        };
    }
}
