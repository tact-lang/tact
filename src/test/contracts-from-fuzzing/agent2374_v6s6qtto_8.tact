struct NestedMany {
    in1: Int;
    in2: Bool;
    in3: String;
    in4: Bool?;
    in5: String?;
}

struct TwiceNested {
    first: NestedMany;
    second: NestedMany;
}

contract TestTwiceNested {
    store: TwiceNested;

    init() {
        self.store = TwiceNested{
            first: NestedMany{
                in1:1,in2:true,in3:"a",in4:null,in5:"b"
            },
            second: NestedMany{
                in1:2,in2:false,in3:"c",in4:true,in5:null
            }
        };
    }
}