struct Inner {
    val: Int = 99;
}

struct Middle {
    inner: Inner;
    flag: Bool = true;
}

struct Top {
    info: Middle;
    text: String = "hello";
}

contract OptionalDeepStruct {
    data: Top?;

    init() {
        self.data = Top{
            info: Middle{
                inner: Inner{}
            }
        };
    }
}