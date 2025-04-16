struct ComboOptNesting {
    inner: Inner1?;
}

struct Inner1 {
    deeper: Inner2?;
}

struct Inner2 {
    s: String?;
}

contract ComboOptContract {
    data: ComboOptNesting;

    init() {
        self.data = ComboOptNesting{
            inner: Inner1{
                deeper: Inner2{
                    s: null
                }
            }
        };
    }
}