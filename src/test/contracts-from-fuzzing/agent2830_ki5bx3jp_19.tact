struct Deep {
    val: Int?;
    flag: Bool;
}

struct Middle {
    inner: Deep;
    txt: String;
}

struct Top {
    a: Middle;
    b: Middle;
}

contract Layered {
    storage: Top;

    init() {
        self.storage = Top{
            a: Middle{inner:Deep{val:null,flag:true}, txt:"x"},
            b: Middle{inner:Deep{val:1,flag:false}, txt:"y"}
        };
    }
}