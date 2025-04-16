struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Middle {
    item: InnerMost;
    text: String;
}

struct Outer {
    arr0: Middle;
    arr1: Middle;
}

contract MultipleNestedStructs {
    data: Outer;
    init() {
        self.data = Outer{
            arr0: Middle{ item: InnerMost{ value:1, flag:true }, text:"hi" },
            arr1: Middle{ item: InnerMost{ value:2, flag:false }, text:"yo" }
        };
    }
}